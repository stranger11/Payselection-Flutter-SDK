import 'dart:math';
import 'dart:convert';
import 'dart:typed_data';
import 'package:convert/convert.dart';
import "package:pointycastle/export.dart";

class EncryptedData {
  final Uint8List encrypted;
  final Uint8List key;
  final Uint8List iv;
  final Uint8List tag;

  const EncryptedData(
      {required this.encrypted,
      required this.key,
      required this.iv,
      required this.tag});
}

class Encryption {
  final ECCurve_secp256k1 _ecCurve = ECCurve_secp256k1();

  late final AsymmetricKeyPair _keyPair;
  late final ECDomainParameters _domainParameters;

  Uint8List randomIv(int blockSize) {
    final random = Random.secure();
    final iv = Uint8List(blockSize);
    for (var i = 0; i < blockSize; i++) {
      iv[i] = random.nextInt(256);
    }
    return iv;
  }

  Uint8List? derivePublicKey(ECPrivateKey pKey) {
    final bigIntD = BigInt.parse(pKey.d.toString());
    final point = _ecCurve.G * bigIntD;
    return point?.getEncoded(false);
  }

  SecureRandom getSecureRandom() {
    var secureRandom = FortunaRandom();
    var random = Random.secure();
    List<int> seeds = [];
    for (int i = 0; i < 32; i++) {
      seeds.add(random.nextInt(255));
    }
    secureRandom.seed(KeyParameter(Uint8List.fromList(seeds)));
    return secureRandom;
  }

  Uint8List bigIntToUint8List(BigInt bigInt) {
    final byteData = ByteData((bigInt.bitLength / 8).ceil());
    var value = bigInt;

    for (var i = byteData.lengthInBytes - 1; i >= 0; i--) {
      byteData.setUint8(i, value.toUnsigned(8).toInt());
      value = value >> 8;
    }

    return byteData.buffer.asUint8List();
  }

  Uint8List deriveSharedKey(
      ECPrivateKey privateKey, ECPublicKey remotePublicKey) {
    final agreement = ECDHBasicAgreement();
    agreement.init(privateKey);
    final sharedKey = agreement.calculateAgreement(remotePublicKey);
    final digit2 =
        SHA512Digest().process(bigIntToUint8List(sharedKey));
    return Uint8List.fromList(digit2);
  }

  ECPrivateKey randomEphemeralKey() {
    var ecParams = ECKeyGeneratorParameters(_domainParameters);
    var params = ParametersWithRandom<ECKeyGeneratorParameters>(
        ecParams, getSecureRandom());
    var keyGenerator = ECKeyGenerator();
    keyGenerator.init(params);
    _keyPair = keyGenerator.generateKeyPair();
    return _keyPair.privateKey as ECPrivateKey;
  }

  ECPublicKey getPublicKey(String pKey) {
    _domainParameters = ECDomainParameters(_ecCurve.domainName);
    final point = _ecCurve.curve.decodePoint(hex.decode(pKey));
    return ECPublicKey(point, _domainParameters);
  }

  Uint8List hmacSha256(Uint8List hmacKey, Uint8List iv,
      Uint8List pKey, Uint8List data) {
    final hmac = HMac(SHA256Digest(), 64);
    final keyParam = KeyParameter(hmacKey);
    hmac.init(keyParam);
    var macData = iv + pKey + data;
    return hmac.process(Uint8List.fromList(macData));
  }

  EncryptedData encrypt(String data, String pKey) {
    final cbcCipher = CBCBlockCipher(AESEngine());
    final publicKey = getPublicKey(pKey);

    final ephemeralPrivateKey = randomEphemeralKey();
    final ephemeralPublicKey = derivePublicKey(ephemeralPrivateKey);
    final sharedKeyHash =
        deriveSharedKey(ephemeralPrivateKey, publicKey);
    final iv = randomIv(cbcCipher.blockSize);
    final paddingParams = PaddedBlockCipherParameters<
        ParametersWithIV<KeyParameter>, Null>(
      ParametersWithIV(
          KeyParameter(sharedKeyHash.sublist(0, 32)), iv),
      null,
    );
    final paddedCipher =
        PaddedBlockCipherImpl(PKCS7Padding(), cbcCipher)
          ..init(true, paddingParams);
    try {
      final encryptedData =
          paddedCipher.process(Uint8List.fromList(utf8.encode(data)));
      final mac = hmacSha256(
          sharedKeyHash.sublist(32, 64),
          iv,
          ephemeralPublicKey!,
          encryptedData
      );
      return EncryptedData(
          encrypted: encryptedData,
          key: ephemeralPublicKey,
          iv: iv,
          tag: mac);
    } catch (e) {
      print(e);
      return EncryptedData(
          encrypted: Uint8List(0),
          key: Uint8List(0),
          iv: Uint8List(0),
          tag: Uint8List(0));
    }
  }

  String createCryptogram(String paymentData, String publicKey) {
    final encryptedData = encrypt(paymentData, publicKey);
    final sendData = {
      'signedMessage': jsonEncode({
        'encryptedMessage': base64Encode(encryptedData.encrypted),
        'ephemeralPublicKey': base64Encode(encryptedData.key)
      }).toString(),
      'iv': base64Encode(encryptedData.iv),
      'tag': base64Encode(encryptedData.tag),
    };

    return base64Encode(jsonEncode(sendData).codeUnits);
  }
}
