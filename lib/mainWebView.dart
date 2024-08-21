import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainWebView extends StatefulWidget {
  const MainWebView({super.key});

  @override
  State<MainWebView> createState() => _MainWebViewState();
}

class _MainWebViewState extends State<MainWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: WebView(initialUrl: 'http://192.168.10.101:8080',
                onWebViewCreated: (controller) {
                  _controller = controller;
                },
                onPageFinished: (url) {
                  String message = "Hellow Yerim!!";
                  _controller.runJavascript('fromAppToWeb("$message")');
                },
                javascriptMode: JavascriptMode.unrestricted,
                javascriptChannels: <JavascriptChannel>{
                  JavascriptChannel(
                      name: 'toApp',
                      onMessageReceived: (JavascriptMessage message) {
                        Navigator.of(context).pop();
                      }
                  )
                }))
    );
  }
}
