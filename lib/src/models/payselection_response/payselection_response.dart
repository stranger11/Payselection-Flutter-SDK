class PublicPayResponse {
  String? orderId;
  String? transactionId;
  String? amount;
  String? currency;
  String? redirectUrl;
  String? transactionSecretKey;

  PublicPayResponse(
      {this.orderId,
        this.transactionId,
        this.amount,
        this.currency,
        this.redirectUrl,
        this.transactionSecretKey});

  PublicPayResponse.fromJson(Map<String, dynamic> json) {
    orderId = json['OrderId'];
    transactionId = json['TransactionId'];
    amount = json['Amount'];
    currency = json['Currency'];
    redirectUrl = json['RedirectUrl'];
    transactionSecretKey = json['TransactionSecretKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['OrderId'] = orderId;
    data['TransactionId'] = transactionId;
    data['Amount'] = amount;
    data['Currency'] = currency;
    data['RedirectUrl'] = redirectUrl;
    data['TransactionSecretKey'] = transactionSecretKey;
    return data;
  }
}