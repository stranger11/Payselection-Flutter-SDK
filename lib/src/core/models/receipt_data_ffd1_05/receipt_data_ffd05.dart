import 'package:payselection_sdk/src/core/models/receipt_data/receipt_data.dart';

class ReceiptDataFfd05 extends ReceiptData {
  String timestamp;
  String? externalId;
  Receipt receipt;

  ReceiptDataFfd05(
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

class Receipt {
  Client client;
  Company company;
  AgentInfo? agentInfo;
  ReceivePaymentsOperator? supplierInfo;
  List<Items> items;
  List<Payments> payments;
  List<Vats>? vats;
  double total;
  String? additionalCheckProps;
  String? cashier;
  AdditionalUserProps? additionalUserProps;

  Receipt({
    required this.client,
    required this.company,
    this.agentInfo,
    this.supplierInfo,
    required this.items,
    required this.payments,
    this.vats,
    required this.total,
    this.additionalCheckProps,
    this.cashier,
    this.additionalUserProps,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['client'] = client.toJson();
    data['company'] = company.toJson();
    if (agentInfo != null) {
      data['agent_info'] = agentInfo!.toJson();
    }
    if (supplierInfo != null) {
      data['supplier_info'] = supplierInfo!.toJson();
    }
    data['items'] = items.map((v) => v.toJson()).toList();
    data['payments'] = payments.map((v) => v.toJson()).toList();
    if (vats != null) {
      data['vats'] = vats!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    if(additionalCheckProps != null) {
      data['additional_check_props'] = additionalCheckProps;
    }
    if (cashier != null) data['cashier'] = cashier;
    if (additionalUserProps != null) {
      data['additional_user_props'] = additionalUserProps!.toJson();
    }
    return data;
  }
}

class Vats {
  String type;
  double sum;

  Vats({required this.type, required this.sum});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['sum'] = sum;
    return data;
  }
}

class Client {
  String? name;
  String? inn;
  String? email;
  String? phone;

  Client({this.name, this.inn, this.email, this.phone});

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
    if (email != null) {
      data['phone'] = phone;
    }
    return data;
  }
}

class Company {
  String? email;
  String? sno;
  String inn;
  String paymentAddress;

  Company(
      {this.email,
      this.sno,
      required this.inn,
      required this.paymentAddress});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (email != null) {
      data['email'] = email;
    }
    if (sno != null) {
      data['sno'] = sno;
    }
    data['inn'] = inn;
    data['payment_address'] = paymentAddress;
    return data;
  }
}

class AgentInfo {
  String? type;
  PayingAgent? payingAgent;
  ReceivePaymentsOperator? receivePaymentsOperator;
  MoneyTransferOperator? moneyTransferOperator;

  AgentInfo(
      {this.type,
      this.payingAgent,
      this.receivePaymentsOperator,
      this.moneyTransferOperator});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (type != null) {
      data['type'] = type;
    }
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

class PayingAgent {
  String? operation;
  List<String>? phones;

  PayingAgent({this.operation, this.phones});

  PayingAgent.fromJson(Map<String, dynamic> json) {
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

class ReceivePaymentsOperator {
  List<String>? phones;

  ReceivePaymentsOperator({this.phones});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phones'] = phones;
    return data;
  }
}

class MoneyTransferOperator {
  List<String>? phones;
  String? name;
  String? address;
  String? inn;

  MoneyTransferOperator(
      {this.phones, this.name, this.address, this.inn});

  MoneyTransferOperator.fromJson(Map<String, dynamic> json) {
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

class Items {
  String name;
  int price;
  double quantity;
  double sum;
  String? measurementUnit;
  String paymentMethod;
  String paymentObject;
  String? nomenclatureCode;
  Vat vat;
  AgentInfo? agentInfo;
  SupplierInfo? supplierInfo;
  String? userData;
  int? excise;
  String? countryCode;
  String? declarationNumber;

  Items(
      {required this.name,
      required this.price,
      required this.quantity,
      required this.sum,
      this.measurementUnit,
      required this.paymentMethod,
      required this.paymentObject,
      this.nomenclatureCode,
      required this.vat,
      this.agentInfo,
      this.supplierInfo,
      this.userData,
      this.excise,
      this.countryCode,
      this.declarationNumber});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['quantity'] = quantity;
    data['sum'] = sum;
    if (measurementUnit != null) {
      data['measurement_unit'] = measurementUnit;
    }
    data['payment_method'] = paymentMethod;
    data['payment_object'] = paymentObject;
    if (nomenclatureCode != null) {
      data['nomenclature_code'] = nomenclatureCode;
    }
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
    data['excise'] = excise;
    if (excise != null) {
      data['country_code'] = countryCode;
    }
    if (declarationNumber != null) {
      data['declaration_number'] = declarationNumber;
    }
    return data;
  }
}

class Vat {
  String? type;
  double? sum;

  Vat({this.type, this.sum});

  Vat.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    sum = json['sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['sum'] = sum;
    return data;
  }
}

class SupplierInfo {
  List<String>? phones;
  String? name;
  String? inn;

  SupplierInfo({this.phones, this.name, this.inn});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (phones != null) data['phones'] = phones;
    if (name != null) data['name'] = name;
    if (inn != null) data['inn'] = inn;
    return data;
  }
}

class Payments {
  int type;
  double sum;

  Payments({required this.type, required this.sum});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['sum'] = sum;
    return data;
  }
}

class AdditionalUserProps {
  String name;
  String value;

  AdditionalUserProps({required this.name, required this.value});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['value'] = value;
    return data;
  }
}
