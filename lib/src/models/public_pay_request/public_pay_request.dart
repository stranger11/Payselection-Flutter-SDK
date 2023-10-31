import 'dart:convert';

import '../../crypto_module.dart';
import '../customer_info/customer_info.dart';
import '../payment_data/payment_data.dart';
import '../receipt_data/receipt_data.dart';

class PublicPayRequest {
  String orderId;
  String description;
  PaymentData paymentData;
  CustomerInfo customerInfo;
  bool rebillFlag;
  ReceiptData? receiptData;

  PublicPayRequest(
      {required this.orderId,
      required this.description,
      required this.paymentData,
      required this.customerInfo,
      required this.rebillFlag,
      this.receiptData});

  Map<String, dynamic> toJson(String publicPay) => {
        'OrderId': orderId,
        'Description': description,
        'Amount': paymentData.transactionDetails.amount,
        'Currency': paymentData.transactionDetails.currency,
        "PaymentMethod": "Cryptogram",
        'PaymentDetails':
            Details(value: createCryptogram(paymentData, publicPay))
                .toJson(),
        'CustomerInfo': customerInfo.toJson(),
        'rebillFlag': rebillFlag,
        if (receiptData != null) 'ReceiptData': receiptData?.toJson()
      };

  String createCryptogram(PaymentData data, String publicKey) {
    return Encryption()
        .createCryptogram(jsonEncode(data).toString(), publicKey);
  }
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
