
import '../card_details/card_details.dart';
import '../transaction_details/transaction_details.dart';

class PaymentData {
  CardDetails cardDetails;
  int messageExpiration;
  TransactionDetails transactionDetails;

  PaymentData({
    required this.cardDetails,
    required this.messageExpiration,
    required this.transactionDetails,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'PaymentDetails': cardDetails.toJson(),
        'MessageExpiration': messageExpiration,
        'PaymentMethod': 'Card',
        'TransactionDetails': transactionDetails.toJson(),
      };
}
