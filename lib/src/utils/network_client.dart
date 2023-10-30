import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:payselection_sdk/payselection.dart';
import 'package:payselection_sdk/src/constants.dart';


class NetworkClient {
  const NetworkClient(this._config);

  final PaySelectionConfig _config;

  Future<Response> call<Response extends BaseResponse>(
      Map<String, dynamic> request,
      Response Function(Map<String, dynamic> json) response) async {
    final PaySelectionConfig config = _config;

    final requestBody = jsonEncode(request);

    final settings = NetworkSettings(
        siteId: config.xSiteId,
        reqId: config.xRequestId
    );

    http.Response rawResponse;
    try {
      rawResponse = await http
          .post(
            Uri.parse(
                '${NetworkSettings.domain}/payments/requests/public'),
            headers: settings.baseHeaders(),
            body: requestBody,
          )
          .timeout(NetworkSettings.timeout);
      if (config.isDebug) print(requestBody);
    } catch (e) {
      print('Error making payment request: $e');

      rethrow;
    }
    late Response response0;

    final dynamic json = jsonDecode(rawResponse.body);
    response0 = response(json as Map<String, dynamic>);

    return response0;
  }
}
