import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShowInBrowser extends StatefulWidget {
 final String? url;
 final BuildContext context;

 ShowInBrowser(this.context,this.url);

  @override
  State<ShowInBrowser> createState() => _ShowInBrowserState();
}

class _ShowInBrowserState extends State<ShowInBrowser> {
 late WebViewController _webViewController;

 final Completer<WebViewController> _controller =  Completer<WebViewController>();

 String currentUrl = "";

  @override
  Widget build(BuildContext context) {
    currentUrl = widget.url!;
    return WillPopScope( onWillPop: () async {
      return true;
    },
      child: Scaffold(appBar: AppBar(title: Text(currentUrl)),body: WebView(
      initialUrl: widget.url!,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _webViewController = webViewController;
        _controller.complete(webViewController);
      },
      onPageFinished:(finish){
        setState(() {
          currentUrl = _webViewController.currentUrl().toString();
        });
      },
    ),),);


  }
}

