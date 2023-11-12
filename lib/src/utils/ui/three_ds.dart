import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ThreeDS extends StatefulWidget {
  final String url;

  const ThreeDS({required this.url, super.key});

  @override
  State<ThreeDS> createState() => _ThreeDSState();
}

class _ThreeDSState extends State<ThreeDS> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onUrlChange: (UrlChange change) {
            if(change.url != null) {
              if (change.url!.contains("success")) {
                controller.loadRequest(Uri.parse('about:blank'));
                Navigator.pop(context, true);
              }
              if (change.url!.contains("error")) {
                controller.loadRequest(Uri.parse('about:blank'));
                Navigator.pop(context, false);
              }
            }
          }
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(10),
        child: WebViewWidget(controller: controller));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
