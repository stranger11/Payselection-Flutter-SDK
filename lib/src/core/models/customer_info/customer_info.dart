class CustomerInfo {
  String email;
  String phone;
  String receiptEmail;
  bool isSendReceipt;
  String language;
  String address;
  String town;
  String zip;
  String country;
  String ip;

  CustomerInfo({
    required this.email,
    required this.phone,
    required this.receiptEmail,
    required this.isSendReceipt,
    required this.language,
    required this.address,
    required this.town,
    required this.zip,
    required this.country,
    required this.ip,
  });

  Map<String, dynamic> toJson() => {
        'Email': email,
        'Phone': phone,
        'ReceiptEmail': receiptEmail,
        'IsSendReceipt': isSendReceipt,
        'Language': language,
        'Address': address,
        'Town': town,
        'Zip': zip,
        'Country': country,
        'IP': ip,
      };
}
