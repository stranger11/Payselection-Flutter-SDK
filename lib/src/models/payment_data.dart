
import 'card_details.dart';
import 'transaction_details.dart';

class PaymentData {
  CardDetails cardDetails;
  int messageExpiration;
  String paymentMethod;
  TransactionDetails transactionDetails;

  PaymentData({
    required this.cardDetails,
    required this.messageExpiration,
    required this.paymentMethod,
    required this.transactionDetails,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'PaymentDetails': cardDetails.toJson(),
        'MessageExpiration': messageExpiration,
        'PaymentMethod': paymentMethod,
        'TransactionDetails': transactionDetails.toJson(),
      };
}
