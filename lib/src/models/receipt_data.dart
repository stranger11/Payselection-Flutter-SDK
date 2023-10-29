class ReceiptData {
  String? timestamp;
  String? externalId;
  Receipt? receipt;

  ReceiptData({this.timestamp, this.externalId, this.receipt});

  ReceiptData.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    externalId = json['external_id'];
    receipt = json['receipt'] != null
        ? new Receipt.fromJson(json['receipt'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['external_id'] = this.externalId;
    if (this.receipt != null) {
      data['receipt'] = this.receipt!.toJson();
    }
    return data;
  }
}

class Receipt {
  Client? client;
  Company? company;
  AgentInfo? agentInfo;
  ReceivePaymentsOperator? supplierInfo;
  List<Items>? items;
  List<Payments>? payments;
  List<Vats>? vats;
  double? total;
  String? additionalCheckProps;
  String? cashier;
  AdditionalUserProps? additionalUserProps;

  Receipt(
      {this.client,
      this.company,
      this.agentInfo,
      this.supplierInfo,
      this.items,
      this.payments,
      this.vats,
      this.total,
      this.additionalCheckProps,
      this.cashier,
      this.additionalUserProps});

  Receipt.fromJson(Map<String, dynamic> json) {
    client = json['client'] != null
        ? new Client.fromJson(json['client'])
        : null;
    company = json['company'] != null
        ? new Company.fromJson(json['company'])
        : null;
    agentInfo = json['agent_info'] != null
        ? new AgentInfo.fromJson(json['agent_info'])
        : null;
    supplierInfo = json['supplier_info'] != null
        ? new ReceivePaymentsOperator.fromJson(json['supplier_info'])
        : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    if (json['payments'] != null) {
      payments = <Payments>[];
      json['payments'].forEach((v) {
        payments!.add(new Payments.fromJson(v));
      });
    }
    if (json['vats'] != null) {
      vats = <Vats>[];
      json['vats'].forEach((v) {
        vats!.add(new Vats.fromJson(v));
      });
    }
    total = json['total'];
    additionalCheckProps = json['additional_check_props'];
    cashier = json['cashier'];
    additionalUserProps = json['additional_user_props'] != null
        ? new AdditionalUserProps.fromJson(
            json['additional_user_props'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    if (this.agentInfo != null) {
      data['agent_info'] = this.agentInfo!.toJson();
    }
    if (this.supplierInfo != null) {
      data['supplier_info'] = this.supplierInfo!.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.payments != null) {
      data['payments'] =
          this.payments!.map((v) => v.toJson()).toList();
    }
    if (this.vats != null) {
      data['vats'] = this.vats!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['additional_check_props'] = this.additionalCheckProps;
    data['cashier'] = this.cashier;
    if (this.additionalUserProps != null) {
      data['additional_user_props'] =
          this.additionalUserProps!.toJson();
    }
    return data;
  }
}

class Vats {
  String? type;
  double? sum;

  Vats({this.type, this.sum});

  Vats.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    sum = json['sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['sum'] = this.sum;
    return data;
  }
}

class Client {
  String? name;
  String? inn;
  String? email;
  String? phone;

  Client({this.name, this.inn, this.email, this.phone});

  Client.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    inn = json['inn'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['inn'] = this.inn;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}

class Company {
  String? email;
  String? sno;
  String? inn;
  String? paymentAddress;

  Company({this.email, this.sno, this.inn, this.paymentAddress});

  Company.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    sno = json['sno'];
    inn = json['inn'];
    paymentAddress = json['payment_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['sno'] = this.sno;
    data['inn'] = this.inn;
    data['payment_address'] = this.paymentAddress;
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

  AgentInfo.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    payingAgent = json['paying_agent'] != null
        ? new PayingAgent.fromJson(json['paying_agent'])
        : null;
    receivePaymentsOperator =
        json['receive_payments_operator'] != null
            ? new ReceivePaymentsOperator.fromJson(
                json['receive_payments_operator'])
            : null;
    moneyTransferOperator = json['money_transfer_operator'] != null
        ? new MoneyTransferOperator.fromJson(
            json['money_transfer_operator'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.payingAgent != null) {
      data['paying_agent'] = this.payingAgent!.toJson();
    }
    if (this.receivePaymentsOperator != null) {
      data['receive_payments_operator'] =
          this.receivePaymentsOperator!.toJson();
    }
    if (this.moneyTransferOperator != null) {
      data['money_transfer_operator'] =
          this.moneyTransferOperator!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['operation'] = this.operation;
    data['phones'] = this.phones;
    return data;
  }
}

class ReceivePaymentsOperator {
  List<String>? phones;

  ReceivePaymentsOperator({this.phones});

  ReceivePaymentsOperator.fromJson(Map<String, dynamic> json) {
    phones = json['phones'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phones'] = this.phones;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phones'] = this.phones;
    data['name'] = this.name;
    data['address'] = this.address;
    data['inn'] = this.inn;
    return data;
  }
}

class Items {
  String? name;
  int? price;
  double? quantity;
  double? sum;
  String? measurementUnit;
  String? paymentMethod;
  String? paymentObject;
  String? nomenclatureCode;
  Vat? vat;
  AgentInfo? agentInfo;
  ReceivePaymentsOperator? supplierInfo;
  String? userData;
  int? excise;
  String? countryCode;
  String? declarationNumber;

  Items(
      {this.name,
      this.price,
      this.quantity,
      this.sum,
      this.measurementUnit,
      this.paymentMethod,
      this.paymentObject,
      this.nomenclatureCode,
      this.vat,
      this.agentInfo,
      this.supplierInfo,
      this.userData,
      this.excise,
      this.countryCode,
      this.declarationNumber});

  Items.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    sum = json['sum'];
    measurementUnit = json['measurement_unit'];
    paymentMethod = json['payment_method'];
    paymentObject = json['payment_object'];
    nomenclatureCode = json['nomenclature_code'];
    vat = json['vat'] != null ? new Vat.fromJson(json['vat']) : null;
    agentInfo = json['agent_info'] != null
        ? new AgentInfo.fromJson(json['agent_info'])
        : null;
    supplierInfo = json['supplier_info'] != null
        ? new ReceivePaymentsOperator.fromJson(json['supplier_info'])
        : null;
    userData = json['user_data'];
    excise = json['excise'];
    countryCode = json['country_code'];
    declarationNumber = json['declaration_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['sum'] = this.sum;
    data['measurement_unit'] = this.measurementUnit;
    data['payment_method'] = this.paymentMethod;
    data['payment_object'] = this.paymentObject;
    data['nomenclature_code'] = this.nomenclatureCode;
    if (this.vat != null) {
      data['vat'] = this.vat!.toJson();
    }
    if (this.agentInfo != null) {
      data['agent_info'] = this.agentInfo!.toJson();
    }
    if (this.supplierInfo != null) {
      data['supplier_info'] = this.supplierInfo!.toJson();
    }
    data['user_data'] = this.userData;
    data['excise'] = this.excise;
    data['country_code'] = this.countryCode;
    data['declaration_number'] = this.declarationNumber;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['sum'] = this.sum;
    return data;
  }
}

class SupplierInfo {
  List<String>? phones;
  String? name;
  String? inn;

  SupplierInfo({this.phones, this.name, this.inn});

  SupplierInfo.fromJson(Map<String, dynamic> json) {
    phones = json['phones'].cast<String>();
    name = json['name'];
    inn = json['inn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phones'] = this.phones;
    data['name'] = this.name;
    data['inn'] = this.inn;
    return data;
  }
}

class Payments {
  int? type;
  double? sum;

  Payments({this.type, this.sum});

  Payments.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    sum = json['sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['sum'] = this.sum;
    return data;
  }
}

class AdditionalUserProps {
  String? name;
  String? value;

  AdditionalUserProps({this.name, this.value});

  AdditionalUserProps.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}
