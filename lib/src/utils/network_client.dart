import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:payselection_sdk/payselection.dart';
import 'package:payselection_sdk/src/constants.dart';
import 'package:payselection_sdk/src/models/payselection_request/payselection_request.dart';

class NetworkClient {
  const NetworkClient(this._config);

  final PaySelectionConfig _config;

  Future<Response> call<Response extends BaseResponse>(
      PaySelectionRequest request,
      Response Function(Map<String, dynamic> json) response) async {
    final PaySelectionConfig config = _config;

    final requestBody = jsonEncode(request.toJson(_config.publicKey));

    final settings = NetworkSettings(
        siteId: config.xSiteId, reqId: config.xRequestId);

    final url = Uri.parse(
        '${NetworkSettings.domain}${request.apiMethodPath}');
    http.Response rawResponse;
    try {
      rawResponse = await http
          .post(
            url,
            headers: settings.baseHeaders(),
            body: requestBody,
          )
          .timeout(NetworkSettings.timeout);
      if (config.isDebug) {
        log(url.toString());
        log("Request header: ${settings.baseHeaders().toString()}");
        log(requestBody);
      }
    } catch (e) {
      debugPrint('Error making payment request: $e');

      rethrow;
    }
    late Response response0;

    final dynamic json = jsonDecode(rawResponse.body);
    response0 = response(json as Map<String, dynamic>);

    return response0;
  }
}
