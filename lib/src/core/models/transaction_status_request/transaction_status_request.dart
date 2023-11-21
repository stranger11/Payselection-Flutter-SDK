import 'package:payselection_sdk/src/constants.dart';
import 'package:payselection_sdk/src/core/models/payselection_request/payselection_request.dart';

class TransactionStatusRequest extends PaySelectionRequest {
  TransactionStatusRequest(
      {required this.transactionId,
      required this.transactionSecretKey});

  final String transactionId;
  final String transactionSecretKey;

  @override
  String get apiMethod => 'transactions/$transactionId';

  @override
  String get httpMethod => HttpMethods.get;
}
