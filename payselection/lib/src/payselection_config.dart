import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/payselection_request.dart';
import 'models/payselection_response.dart';

class PaySelectionConfig {
  final String publicKey;
  final String xSiteId;
  final String xRequestId;
  final String baseUrl = "https://pgw.payselection.com";
  final int timeout = 30000;

  PaySelectionConfig(
      {required this.publicKey,
      required this.xSiteId,
      required this.xRequestId});

  Future<PaySelectionResponse> makePayment(
      PublicPayRequest request) async {
    final uri = Uri.parse('$baseUrl/payments/requests/public');
    final headers = {
      "X-SITE-ID": xSiteId,
      "X-REQUEST-ID": xRequestId,
      "Content-Type": "application/json",
    };

    final requestBody = jsonEncode(request.toJson());

    try {
      final response = await http.post(
        uri,
        headers: headers,
        body: requestBody,
      );

      print(requestBody);
      if (response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
        return PaySelectionResponse.fromJson(jsonResponse);
      } else {
        print(
            'Failed to make payment request: ${response.statusCode}');
        throw Exception('Failed to make payment request');
      }
    } catch (e, stackTrace) {
      print('Error making payment request: $e');
      print(stackTrace);
      rethrow;
    }
  }
}
