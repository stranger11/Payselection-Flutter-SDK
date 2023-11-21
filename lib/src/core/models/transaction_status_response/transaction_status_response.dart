import '../../../../payselection.dart';

class TransactionStatusResponse extends BaseResponse {
  String? transactionState;
  String? transactionId;
  String? orderId;
  StateDetails? stateDetails;

  TransactionStatusResponse(
      {String? code,
      String? description,
      AddDetails? addDetails,
      this.transactionState,
      this.transactionId,
      this.orderId,
      this.stateDetails});

  factory TransactionStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      TransactionStatusResponse(
          transactionState: json['TransactionState'] as String?,
          transactionId: json['TransactionId'] as String?,
          orderId: json['OrderId'] as String?,
          stateDetails: StateDetails.fromJson(json));

  @override
  Map<String, dynamic> toJson() => {
        if (code != null) ...{
          'Code': code,
          'Description': description,
          'AddDetails': addDetails
        } else ...{
          'TransactionState': transactionState,
          'TransactionId': transactionId,
          'OrderId': orderId,
          if (stateDetails != null) 'StateDetails': stateDetails
        }
      };
}

class StateDetails {
  String? amount;
  String? currency;
  String? dateTime;
  int? isTest;
  String? email;
  String? phone;
  String? description;
  String? customFields;
  String? brand;
  String? countryCodeAlpha2;
  String? bank;
  String? cardMasked;
  String? cardHolder;
  String? payoutToken;
  String? rebillId;
  String? expirationDate;
  String? rRN;
  String? errorCode;
  String? subtype;

  StateDetails(
      {this.amount,
      this.currency,
      this.dateTime,
      this.isTest,
      this.email,
      this.phone,
      this.description,
      this.customFields,
      this.brand,
      this.countryCodeAlpha2,
      this.bank,
      this.cardMasked,
      this.cardHolder,
      this.payoutToken,
      this.rebillId,
      this.expirationDate,
      this.rRN,
      this.errorCode,
      this.subtype});

  StateDetails.fromJson(Map<String, dynamic> json) {
    amount = json['Amount'];
    currency = json['Currency'];
    dateTime = json['DateTime'];
    isTest = json['IsTest'];
    email = json['Email'];
    phone = json['Phone'];
    description = json['Description'];
    customFields = json['CustomFields'];
    brand = json['Brand'];
    countryCodeAlpha2 = json['CountryCodeAlpha2'];
    bank = json['Bank'];
    cardMasked = json['CardMasked'];
    cardHolder = json['CardHolder'];
    payoutToken = json['PayoutToken'];
    rebillId = json['RebillId'];
    expirationDate = json['ExpirationDate'];
    rRN = json['RRN'];
    errorCode = json['ErrorCode'];
    subtype = json['Subtype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Amount'] = amount;
    data['Currency'] = currency;
    data['DateTime'] = dateTime;
    data['IsTest'] = isTest;
    data['Email'] = email;
    data['Phone'] = phone;
    data['Description'] = description;
    data['CustomFields'] = customFields;
    data['Brand'] = brand;
    data['CountryCodeAlpha2'] = countryCodeAlpha2;
    data['Bank'] = bank;
    data['CardMasked'] = cardMasked;
    data['CardHolder'] = cardHolder;
    data['PayoutToken'] = payoutToken;
    data['RebillId'] = rebillId;
    data['ExpirationDate'] = expirationDate;
    data['RRN'] = rRN;
    data['ErrorCode'] = errorCode;
    data['Subtype'] = subtype;
    return data;
  }
}
