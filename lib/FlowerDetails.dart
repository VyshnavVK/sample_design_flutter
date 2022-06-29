import 'dart:io';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:sample_design/Model/Model.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'ShowInBrowser.dart';

class FlowerDetails extends StatelessWidget {
  final Model model;
  final BuildContext context;

  const FlowerDetails(this.context, this.model);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    var screenSize = MediaQuery.maybeOf(context)!.size;
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(title: Text(model.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Blur(
                  blur: 2.5,
                  child: AspectRatio(
                      aspectRatio: 16 / 7,
                      child: Image(
                        fit: BoxFit.cover,
                        width: double.infinity,
                        image: NetworkImage(model.image),
                      )),
                ),
                Center(
                  child: Padding(
                      padding: EdgeInsets.only(
                        top: screenSize.width * 0.2,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: screenSize.width * 0.18,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(model.image),
                          radius: screenSize.width * 0.15,
                        ),
                      )),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 10),
              width: double.infinity,
              alignment: Alignment.topLeft,
              child: Text(
                model.title,
                style: TextStyle(
                    color: Colors.green[900],
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 10),
              width: double.infinity,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                model.message,
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 25),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowInBrowser(context,
                            "https://www.google.com/search?q=${model.title}"),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: SizedBox(
                        width: 25,
                        height: 25,
                        child: Image.asset("assets/icons/google.png")),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 25),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowInBrowser(context,
                            "https://www.bing.com/search?q=${model.title}"),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: SizedBox(
                        width: 25,
                        height: 25,
                        child: Image.asset("assets/icons/bing.jpg")),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 25),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowInBrowser(context,
                            "https://duckduckgo.com/?q=${model.title}"),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: SizedBox(
                        width: 30,
                        height: 30,
                        child: Image.asset("assets/icons/duckduckgo.jpg")),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
