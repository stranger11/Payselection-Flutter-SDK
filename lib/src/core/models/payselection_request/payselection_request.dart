
abstract class PaySelectionRequest {

  Map<String, dynamic> toJson(String pKey) => {};

  String get httpMethod;

  String get apiMethod;

  String get apiMethodPath => '/$apiMethod';

}