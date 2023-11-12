class TransactionDetails {
  String amount;
  String currency;

  TransactionDetails({
    required this.amount,
    required this.currency,
  });

  Map<String, dynamic> toJson() => {
        'Amount': amount,
        'Currency': currency,
      };
}
