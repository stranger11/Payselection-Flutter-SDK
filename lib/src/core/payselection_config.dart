import '../utils/logger.dart';

sealed class PaySelectionConfig {
  factory PaySelectionConfig.credential({
    required String publicKey,
    required String xSiteId,
    required String xRequestId,
    required bool isDebug,
    BaseLogger logger,
  }) = PaySelectionConfigCredential;

  const PaySelectionConfig._({
    this.isDebug = true,
    this.logger = const Logger(),
  });

  final bool isDebug;

  final BaseLogger logger;

}

class PaySelectionConfigCredential extends PaySelectionConfig {
  const PaySelectionConfigCredential(
      {required this.publicKey,
      required this.xSiteId,
      required this.xRequestId,
      bool isDebug = true,
      BaseLogger logger = const Logger()})
      : super._(
            isDebug: isDebug,
            logger: logger);

  final String publicKey;

  final String xSiteId;

  final String xRequestId;
}
