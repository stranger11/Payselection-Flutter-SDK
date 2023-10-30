class NetworkSettings {

  final String siteId;
  final String reqId;

  NetworkSettings({required this.siteId, required this.reqId});

  static const String domain = 'https://pgw.payselection.com';
  static const String xSiteId= 'X-SITE-ID';
  static const String xReqId = 'X-REQUEST-ID';

  static const Duration timeout = Duration(seconds: 30);

  static const String contentType = 'content-type';
  static const String contentTypeJson = 'application/json';

  Map<String, String> baseHeaders() => {
    xSiteId: siteId,
    xReqId: reqId,
    contentType: contentTypeJson
  };
}
