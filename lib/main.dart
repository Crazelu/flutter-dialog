import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../dialog/locator.dart';
import 'dialog/dialog_demo_page.dart';
import 'dialog/dialog_manager.dart';

void main() {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialog Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DialogDemoPage(),
      builder: (context, widget) => Navigator(
        onGenerateRoute: (settings) => CupertinoPageRoute(
          builder: (context) => DialogManager(
            child: widget!,
          ),
        ),
      ),
    );
  }
}
