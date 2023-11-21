import 'package:payselection_sdk/payselection.dart';

class PublicPayResponse extends BaseResponse {
  PublicPayResponse({
    String? code,
    String? description,
    AddDetails? addDetails,
    this.orderId,
    this.transactionId,
    this.amount,
    this.currency,
    this.redirectUrl,
    this.transactionSecretKey,
  }) : super(
            code: code,
            description: description,
            addDetails: addDetails);

  factory PublicPayResponse.fromJson(Map<String, dynamic> json) =>
      PublicPayResponse(
        orderId: json['OrderId'] as String?,
        transactionId: json['TransactionId'] as String?,
        amount: json['Amount'] as String?,
        currency: json['Currency'] as String?,
        redirectUrl: json['RedirectUrl'] as String?,
        transactionSecretKey: json['TransactionSecretKey'] as String?,
      );

  @override
  Map<String, dynamic> toJson() => {
        if (code != null) ...{
          'Code': code,
          'Description': description,
          'AddDetails': addDetails,
        } else ...{
          'OrderId': orderId,
          'TransactionId': transactionId,
          'Amount': amount,
          'Currency': currency,
          'RedirectUrl': redirectUrl,
          'TransactionSecretKey': transactionSecretKey,
        }
      };

  String? orderId;

  String? transactionId;

  String? amount;

  String? currency;

  String? redirectUrl;

  String? transactionSecretKey;
}
