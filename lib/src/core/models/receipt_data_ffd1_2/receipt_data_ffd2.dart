import 'package:payselection_sdk/src/core/models/receipt_data/receipt_data.dart';

class ReceiptDataFfd2 extends ReceiptData {
  String timestamp;
  String? externalId;
  Receipt2 receipt;

  ReceiptDataFfd2(
      {required this.timestamp,
      this.externalId,
      required this.receipt});

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['external_id'] = externalId;
    data['receipt'] = receipt.toJson();
    return data;
  }
}

class Receipt2 {
  Client2 client;
  Company2 company;
  List<Items2> items;
  List<Payments2> payments;
  List<Vats2>? vats;
  double total;
  String? additionalCheckProps;
  String? cashier;
  AdditionalUserProps2? additionalUserProps;
  OperatingCheckProps? operatingCheckProps;
  SectoralCheckProps? sectoralCheckProps;

  Receipt2(
      {required this.client,
      required this.company,
      required this.items,
      required this.payments,
      this.vats,
      required this.total,
      this.additionalCheckProps,
      this.cashier,
      this.additionalUserProps,
      this.sectoralCheckProps});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['client'] = client.toJson();
    data['company'] = company.toJson();
    data['items'] = items.map((v) => v.toJson()).toList();
    data['payments'] = payments.map((v) => v.toJson()).toList();
    if (vats != null) {
      data['vats'] = vats!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['additional_check_props'] = additionalCheckProps;
    if (cashier != null) data['cashier'] = cashier;
    if (additionalUserProps != null) {
      data['additional_user_props'] = additionalUserProps!.toJson();
    }
    if (operatingCheckProps != null) {
      data['operating_check_props'] = operatingCheckProps!.toJson();
    }
    if (sectoralCheckProps != null) {
      data['sectoral_check_props'] = sectoralCheckProps!.toJson();
    }
    return data;
  }
}

class Vats2 {
  String type;
  double sum;

  Vats2({required this.type, required this.sum});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['sum'] = sum;
    return data;
  }
}

class Client2 {
  String? name;
  String? inn;
  String? email;
  String? phone;

  Client2({this.name, this.inn, this.email, this.phone});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) {
      data['name'] = name;
    }
    if (inn != null) {
      data['inn'] = inn;
    }
    if (email != null) {
      data['email'] = email;
    }
    if (phone != null) {
      data['phone'] = phone;
    }
    return data;
  }
}

class Company2 {
  String? email;
  String sno;
  String inn;
  String paymentAddress;

  Company2(
      {this.email,
      required this.sno,
      required this.inn,
      required this.paymentAddress});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (email != null) {
      data['email'] = email;
    }
    data['sno'] = sno;
    data['inn'] = inn;
    data['payment_address'] = paymentAddress;
    return data;
  }
}

class AgentInfo2 {
  String? type;
  PayingAgent2? payingAgent;
  ReceivePaymentsOperator2? receivePaymentsOperator;
  MoneyTransferOperator2? moneyTransferOperator;

  AgentInfo2(
      {this.type,
      this.payingAgent,
      this.receivePaymentsOperator,
      this.moneyTransferOperator});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (payingAgent != null) {
      data['paying_agent'] = payingAgent!.toJson();
    }
    if (receivePaymentsOperator != null) {
      data['receive_payments_operator'] =
          receivePaymentsOperator!.toJson();
    }
    if (moneyTransferOperator != null) {
      data['money_transfer_operator'] =
          moneyTransferOperator!.toJson();
    }
    return data;
  }
}

class PayingAgent2 {
  String? operation;
  List<String>? phones;

  PayingAgent2({this.operation, this.phones});

  PayingAgent2.fromJson(Map<String, dynamic> json) {
    operation = json['operation'];
    phones = json['phones'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['operation'] = operation;
    data['phones'] = phones;
    return data;
  }
}

class ReceivePaymentsOperator2 {
  List<String>? phones;

  ReceivePaymentsOperator2({this.phones});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phones'] = phones;
    return data;
  }
}

class MoneyTransferOperator2 {
  List<String>? phones;
  String? name;
  String? address;
  String? inn;

  MoneyTransferOperator2(
      {this.phones, this.name, this.address, this.inn});

  MoneyTransferOperator2.fromJson(Map<String, dynamic> json) {
    phones = json['phones'].cast<String>();
    name = json['name'];
    address = json['address'];
    inn = json['inn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phones'] = phones;
    data['name'] = name;
    data['address'] = address;
    data['inn'] = inn;
    return data;
  }
}

class Items2 {
  String name;
  int price;
  double quantity;
  double sum;
  int measure;
  String paymentMethod;
  int paymentObject;
  Vat2 vat;
  AgentInfo2? agentInfo;
  SupplierInfo2? supplierInfo;
  String? userData;
  int? excise;
  String? countryCode;
  String? declarationNumber;
  MarkQuantity? markQuantity;
  String? markProcessingMode;
  List<SectoralItemProps>? sectoralItemProps;
  MarkCode? markCode;

  Items2(
      {required this.name,
      required this.price,
      required this.quantity,
      required this.sum,
      required this.measure,
      required this.paymentMethod,
      required this.paymentObject,
      required this.vat,
      this.agentInfo,
      this.supplierInfo,
      this.userData,
      this.excise,
      this.countryCode,
      this.declarationNumber,
      this.markQuantity,
      this.markProcessingMode,
      this.sectoralItemProps,
      this.markCode});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['quantity'] = quantity;
    data['sum'] = sum;
    data['measure'] = measure;
    data['payment_method'] = paymentMethod;
    data['payment_object'] = paymentObject;
    data['vat'] = vat.toJson();
    if (agentInfo != null) {
      data['agent_info'] = agentInfo!.toJson();
    }
    if (supplierInfo != null) {
      data['supplier_info'] = supplierInfo!.toJson();
    }
    if (userData != null) {
      data['user_data'] = userData;
    }
    if (excise != null) {
      data['excise'] = excise;
    }
    if (countryCode != null) {
      data['country_code'] = countryCode;
    }
    if (declarationNumber != null) {
      data['declaration_number'] = declarationNumber;
    }
    if (markQuantity != null) {
      data['mark_quantity'] = markQuantity;
    }
    if (markProcessingMode != null) {
      data['mark_processing_mode'] = markProcessingMode;
    }
    if (sectoralItemProps != null) {
      data['sectoral_item_props'] =
          sectoralItemProps!.map((v) => v.toJson()).toList();
    }
    if (markCode != null) {
      data['mark_code'] = markCode!.toJson();
    }

    return data;
  }
}

class MarkCode {
  String? unknown;
  String? ean;
  String? ean13;
  String? intf14;
  String? gs10;
  String? gs1m;
  String? short;
  String? fur;
  String? egais20;
  String? egais30;

  MarkCode(
      {this.unknown,
      this.ean,
      this.ean13,
      this.intf14,
      this.gs10,
      this.gs1m,
      this.short,
      this.fur,
      this.egais20,
      this.egais30});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (unknown != null) {
      data['unknown'] = unknown;
    }
    if (ean != null) {
      data['ean'] = ean;
    }
    if (ean13 != null) {
      data['ean13'] = ean13;
    }
    if (intf14 != null) {
      data['intf14'] = intf14;
    }
    if (gs10 != null) {
      data['gs10'] = gs10;
    }
    if (gs1m != null) {
      data['gs1m'] = gs1m;
    }
    if (short != null) {
      data['short'] = short;
    }
    if (fur != null) {
      data['fur'] = fur;
    }
    if (egais20 != null) {
      data['egais20'] = egais20;
    }
    if (egais30 != null) {
      data['egais30'] = egais30;
    }
    return data;
  }
}

class SectoralItemProps {
  String federalId;
  String date;
  String number;
  String value;

  SectoralItemProps(
      {required this.federalId,
      required this.date,
      required this.number,
      required this.value});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['federal_id'] = federalId;
    data['date'] = date;
    data['number'] = number;
    data['value'] = value;
    return data;
  }
}

class MarkQuantity {
  int? numberator;
  int denominator;

  MarkQuantity({this.numberator, required this.denominator});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (numberator != null) {
      data['numberator'] = numberator;
    }
    data['denominator'] = denominator;
    return data;
  }
}

class Vat2 {
  String type;
  double? sum;

  Vat2({required this.type, this.sum});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if(sum != null) {
      data['sum'] = sum;
    }
    return data;
  }
}

class SupplierInfo2 {
  List<String> phones;
  String? name;
  String? inn;

  SupplierInfo2({required this.phones, this.name, this.inn});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phones'] = phones;
    if (name != null) {
      data['name'] = name;
    }
    if (inn != null) {
      data['inn'] = inn;
    }
    return data;
  }
}

class Payments2 {
  int type;
  double sum;

  Payments2({required this.type, required this.sum});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['sum'] = sum;
    return data;
  }
}

class AdditionalUserProps2 {
  String name;
  String value;

  AdditionalUserProps2({required this.name, required this.value});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['value'] = value;
    return data;
  }
}

class OperatingCheckProps {
  String name;
  String value;
  String timestamp;

  OperatingCheckProps(
      {required this.name,
      required this.value,
      required this.timestamp});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['value'] = value;
    data['timestamp'] = timestamp;
    return data;
  }
}

class SectoralCheckProps {
  String federalId;
  String date;
  String number;
  String value;

  SectoralCheckProps(
      {required this.federalId,
      required this.date,
      required this.number,
      required this.value});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['federal_id'] = federalId;
    data['date'] = date;
    data['number'] = number;
    data['value'] = value;
    return data;
  }
}
