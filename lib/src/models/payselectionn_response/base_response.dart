import '../../../payselection.dart';

class BaseResponse<M> {
  BaseResponse({this.data});

  M? data;

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      BaseResponse(data: _dataFromJson(json, M));

  static I _dataFromJson<I, T>(json, Type type) {
    if (type == PublicPayResponse) {
      return PublicPayResponse.fromJson(json) as I;
    }
    if (type == PublicPayError) {
      return PublicPayError.fromJson(json) as I;
    }
    return json as I;
  }
}





class PublicPayError {
  final String code;
  final String? description;
  final FailDetails? addDetails;

  PublicPayError(
      {required this.code,
      this.description,
      required this.addDetails});

  factory PublicPayError.fromJson(Map<String, dynamic> json) =>
      PublicPayError(
          code: json['Code'],
          description: json['Description'] ,
          addDetails: json['AddDetails']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'Code': code,
      'Description': description,
      'AddDetails': addDetails?.toJson(), // Convert addDetails to JSON if not null
    };
    return data;
  }
}

class FailDetails {
  final String orderId;
  final String transactionId;

  FailDetails({required this.orderId, required this.transactionId});

  factory FailDetails.fromJson(Map<String, dynamic> json) {
    return FailDetails(
      orderId: json['OrderId'] ?? '',
      transactionId: json['TransactionId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'OrderId': orderId,
      'TransactionId': transactionId,
    };
  }
}
