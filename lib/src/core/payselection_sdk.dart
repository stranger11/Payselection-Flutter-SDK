import 'package:payselection_sdk/src/core/payselection_config.dart';
import '../../payselection.dart';
import '../utils/network_client.dart';

class PaySelectionSDK {

  final NetworkClient _network;

  final PaySelectionConfig config;

  PaySelectionSDK(this.config)
      : _network = NetworkClient(config);

  Future<BaseResponse<PublicPayResponse>> pay(
          PublicPayRequest request) async =>
      await _network<BaseResponse<PublicPayResponse>>(request,
          (json) {
        return BaseResponse.fromJson((json));
      });
}
