import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShowInBrowser extends StatefulWidget {
  final String? url;
  final BuildContext context;

  ShowInBrowser(this.context, this.url);

  @override
  State<ShowInBrowser> createState() => _ShowInBrowserState();
}

class _ShowInBrowserState extends State<ShowInBrowser> {
  late WebViewController _webViewController;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  String currentUrl = "";

  @override
  Widget build(BuildContext context) {
    currentUrl = widget.url!;
    return WillPopScope(
      onWillPop: () async {
        if (await _webViewController.canGoBack()) {
          _webViewController.goBack();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: Text(currentUrl)),
        body: WebView(
          initialUrl: widget.url!,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
            _webViewController = webViewController;
          },
          onPageFinished: (finish) {
            setState(() async {
              currentUrl = (await _webViewController.currentUrl())!;
              AppBar(title: Text(currentUrl));
            });
          },
        ),
      ),
    );
  }
}
