
abstract class PaySelectionRequest {

  Map<String, dynamic> toJson(String pKey);

  String get apiMethod;

  String get apiMethodPath => '/$apiMethod';

}