import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:payselection_sdk/payselection.dart';
import 'package:payselection_sdk/src/constants.dart';
import '../core/models/payselection_request/payselection_request.dart';
import '../core/payselection_config.dart';

class NetworkClient {
  const NetworkClient(this._config);

  final PaySelectionConfig _config;

  Future<Response> call<Response extends BaseResponse>(
      PaySelectionRequest request,
      Response Function(Map<String, dynamic> json) response) async {
    final PaySelectionConfig config = _config;

    final requestBody = jsonEncode(_modifyRequest(request, config));

    final settings = NetworkSettings(
        siteId: _siteId(config), reqId: _reqId(config));

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
        config.logger
            .log(message: url.toString(), name: 'Request URL');
        config.logger.log(
            message: settings.baseHeaders().toString(),
            name: 'Request headers');
        config.logger.log(message: requestBody, name: 'RawRequest');
      }
    } catch (e) {
      debugPrint('Error making payment request: $e');

      rethrow;
    }
    late Response response0;

    final dynamic json = jsonDecode(rawResponse.body);
    response0 = response(json as Map<String, dynamic>);

    if (config.isDebug) {
      config.logger.log(
          message: "${rawResponse.statusCode} | ${rawResponse.body}",
          name: 'RawResponse');
    }

    return response0;
  }

  Map<String, dynamic> _modifyRequest(
    PaySelectionRequest request,
    PaySelectionConfig config,
  ) {
    switch (config) {
      case PaySelectionConfigCredential():
        return request.toJson(config.publicKey);
    }
  }

  String _siteId(PaySelectionConfig config) {
    switch (config) {
      case PaySelectionConfigCredential():
        return config.xSiteId;
    }
  }

  String _reqId(PaySelectionConfig config) {
    switch (config) {
      case PaySelectionConfigCredential():
        return config.xRequestId;
    }
  }
}
