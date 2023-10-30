import 'package:payselection_sdk/payselection.dart';

class PublicPayResponse {
  String? code;
  String? orderId;
  String? transactionId;
  String? amount;
  String? currency;
  String? redirectUrl;
  String? transactionSecretKey;
  String? description;
  FailDetails? addDetails;

  PublicPayResponse(
      {this.code,
      this.orderId,
      this.transactionId,
      this.amount,
      this.currency,
      this.redirectUrl,
      this.transactionSecretKey,
      this.description,
      this.addDetails});

  PublicPayResponse.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    orderId = json['OrderId'];
    transactionId = json['TransactionId'];
    amount = json['Amount'];
    currency = json['Currency'];
    redirectUrl = json['RedirectUrl'];
    transactionSecretKey = json['TransactionSecretKey'];
    description = json['Description'];
    addDetails = json['AddDetails'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Code'] = code;
    if (data['Code'] != null) {
      data['Description'] = description;
      data['AddDetails'] = addDetails;
    } else {
      data['OrderId'] = orderId;
      data['TransactionId'] = transactionId;
      data['Amount'] = amount;
      data['Currency'] = currency;
      data['RedirectUrl'] = redirectUrl;
      data['TransactionSecretKey'] = transactionSecretKey;
    }
    return data;
  }
}
