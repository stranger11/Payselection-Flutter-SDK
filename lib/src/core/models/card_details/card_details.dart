class CardDetails {
  String cardNumber;
  String cardHolderName;
  String cvc;
  String expMonth;
  String expYear;

  CardDetails({
    required this.cardNumber,
    required this.cardHolderName,
    required this.cvc,
    required this.expMonth,
    required this.expYear,
  });

  Map<String, dynamic> toJson() =>  <String, dynamic>{
    'CardNumber': cardNumber,
    'CardholderName': cardHolderName,
    'CVC': cvc,
    'ExpMonth': expMonth,
    'ExpYear': expYear,
  };
}
