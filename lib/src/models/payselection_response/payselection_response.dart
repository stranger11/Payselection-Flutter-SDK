class PaySelectionResponse {
  String? orderId;
  String? transactionId;
  String? amount;
  String? currency;
  String? redirectUrl;
  String? transactionSecretKey;

  PaySelectionResponse(
      {this.orderId,
        this.transactionId,
        this.amount,
        this.currency,
        this.redirectUrl,
        this.transactionSecretKey});

  PaySelectionResponse.fromJson(Map<String, dynamic> json) {
    orderId = json['OrderId'];
    transactionId = json['TransactionId'];
    amount = json['Amount'];
    currency = json['Currency'];
    redirectUrl = json['RedirectUrl'];
    transactionSecretKey = json['TransactionSecretKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OrderId'] = this.orderId;
    data['TransactionId'] = this.transactionId;
    data['Amount'] = this.amount;
    data['Currency'] = this.currency;
    data['RedirectUrl'] = this.redirectUrl;
    data['TransactionSecretKey'] = this.transactionSecretKey;
    return data;
  }
}