import 'package:flutter/material.dart';
import 'package:web_view_test/mainWebView.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: MainWebView()
    );
  }
}
