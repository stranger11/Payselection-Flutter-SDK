import 'dart:convert';

import 'package:payselection_sdk/src/models/payselection_request/payselection_request.dart';

import '../../constants.dart';
import '../../crypto_module.dart';
import '../customer_info/customer_info.dart';
import '../payment_data/payment_data.dart';
import '../receipt_data/receipt_data.dart';

class PublicPayRequest extends PaySelectionRequest {
  String orderId;
  String description;
  PaymentData paymentData;
  CustomerInfo customerInfo;
  bool rebillFlag;
  Map<String, dynamic>? extraData;
  ReceiptData? receiptData;

  PublicPayRequest(
      {required this.orderId,
      required this.description,
      required this.paymentData,
      required this.customerInfo,
      required this.rebillFlag,
      this.extraData,
      this.receiptData});

  @override
  Map<String, dynamic> toJson(String pKey) => {
        'OrderId': orderId,
        'Description': description,
        'Amount': paymentData.transactionDetails.amount,
        'Currency': paymentData.transactionDetails.currency,
        "PaymentMethod": "Cryptogram",
        'PaymentDetails':
            Details(value: createCryptogram(paymentData, pKey))
                .toJson(),
        'CustomerInfo': customerInfo.toJson(),
        if (extraData != null) "ExtraData": extraData,
        'rebillFlag': rebillFlag,
        if (receiptData != null) 'ReceiptData': receiptData?.toJson()
      };

  String createCryptogram(PaymentData data, String publicKey) {
    return Encryption()
        .createCryptogram(jsonEncode(data).toString(), publicKey);
  }

  @override
  String get apiMethod => ApiMethods.publicPay;
}

class Details {
  String value;

  Details({required this.value});

  Map<String, dynamic> toJson() => {'Value': value};
}

class PaymentDetails {
  final String publicKey;
  final PublicPayRequest paymentRequest;

  PaymentDetails(
      {required this.publicKey, required this.paymentRequest});
}
