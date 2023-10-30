import 'package:payselection_sdk/src/utils/network_client.dart';
import '../payselection.dart';

class PaySelectionConfig {
  final String publicKey;
  final String xSiteId;
  final String xRequestId;
  final bool isDebug;

  PaySelectionConfig(
      {required this.publicKey,
      required this.xSiteId,
      required this.xRequestId,
      required this.isDebug});

  factory PaySelectionConfig.config(String publicKey, String xSiteId,
          String xRequestId, bool isDebug) =>
      PaySelectionConfig(
          publicKey: publicKey,
          xSiteId: xSiteId,
          xRequestId: xRequestId,
          isDebug: isDebug);
}

class PaySelection {
  final String publicKey;
  final String xSiteId;
  final String xRequestId;
  final bool isDebug;

  final NetworkClient _network;

  PaySelection(
      {required this.publicKey,
      required this.xSiteId,
      required this.xRequestId,
      required this.isDebug})
      : _network = NetworkClient(PaySelectionConfig.config(
            publicKey, xSiteId, xRequestId, isDebug));

  Future<BaseResponse> pay(PublicPayRequest request) async {
    final response = await _network<BaseResponse>(
      request.toJson(publicKey),
      (json) {
        if (json.containsKey('Code')) {
          return BaseResponse<PublicPayError>(
              data: PublicPayError.fromJson(json));
        } else {
          return BaseResponse<PublicPayResponse>(
              data: PublicPayResponse.fromJson(json));
        }
      },
    );
    return response;
  }
}
