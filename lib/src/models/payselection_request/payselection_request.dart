
import 'dart:convert';

import '../../crypto_module.dart';
import '../customer_info/customer_info.dart';
import '../payment_data/payment_data.dart';
import '../receipt_data/receipt_data.dart';

class PublicPayRequest {
  String publicKey;
  String orderId;
  String description;
  PaymentData paymentData;
  CustomerInfo customerInfo;
  bool rebillFlag;
  ReceiptData? receiptData;

  PublicPayRequest(
      {required this.publicKey,
      required this.orderId,
      required this.description,
      required this.paymentData,
      required this.customerInfo,
      required this.rebillFlag,
      this.receiptData});

  Map<String, dynamic> toJson() => {
        'OrderId': orderId,
        'Description': description,
        'Amount': paymentData.transactionDetails.amount,
        'Currency': paymentData.transactionDetails.currency,
        "PaymentMethod": "Token",
        'PaymentDetails': Details(
                type: 'Internal',
                payToken: createCryptogram(paymentData, publicKey))
            .toJson(),
        'CustomerInfo': customerInfo.toJson(),
        'rebillFlag': rebillFlag,
        if (this.receiptData != null) 'ReceiptData': receiptData
      };

  String createCryptogram(PaymentData data, String publicKey) {
    return Encryption()
        .createCryptogram(jsonEncode(data).toString(), publicKey);
  }
}

class Details {
  String type;
  String payToken;

  Details({required this.type, required this.payToken});

  Map<String, dynamic> toJson() =>
      {'Type': type, 'PayToken': payToken};
}

class PaymentDetails {
  final String publicKey;
  final PublicPayRequest paymentRequest;

  PaymentDetails(
      {required this.publicKey, required this.paymentRequest});
}
