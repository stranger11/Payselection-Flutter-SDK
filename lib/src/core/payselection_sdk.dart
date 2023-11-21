import 'package:payselection_sdk/src/core/models/transaction_status_request/transaction_status_request.dart';
import 'package:payselection_sdk/src/core/models/transaction_status_response/transaction_status_response.dart';
import 'package:payselection_sdk/src/core/payselection_config.dart';
import '../../payselection.dart';
import '../utils/network_client.dart';

class PaySelectionSDK {
  final NetworkClient _network;

  final PaySelectionConfig config;

  PaySelectionSDK(this.config) : _network = NetworkClient(config);




  //PublicPay метод SDK
  Future<BaseResponse<PublicPayResponse>> pay(
          PublicPayRequest request) async =>
      await _network<BaseResponse<PublicPayResponse>>(request,
          (json) {
        return BaseResponse.fromJson(json);
      });



  //Метод получения статуса транзакции
  Future<BaseResponse<TransactionStatusResponse>> transactionStatus(
          TransactionStatusRequest request) async =>
      await _network<BaseResponse<TransactionStatusResponse>>(request,
          (json) {
        return BaseResponse.fromJson(json);
      });
}
