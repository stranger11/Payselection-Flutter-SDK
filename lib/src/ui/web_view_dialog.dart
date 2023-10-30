import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewHelper {
  static Future<bool?> openWebView(BuildContext context,
      String url) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            const CircularProgressIndicator();
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(url));

    controller.setOnConsoleMessage((message) {
      if (message.message.contains('TransactionStatus:success')) {
        Navigator.pop(context, true);
      } else if (message.message.contains('TransactionStatus:error')) {
        Navigator.pop(context, false);
      }
    });

    final result = showDialog<bool?>(
        context: context,
        builder: (builder) =>
            Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: const EdgeInsets.all(10),
                child: WebViewWidget(controller: controller)));
    return result;
  }
}
