import 'package:flutter/material.dart';
import 'package:flutter_community_web/ui/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(primaryColor: Colors.white), //主题颜色
      home: login(),
      routes: <String,WidgetBuilder>{
        "login":(BuildContext context) => login(),
      },
    );
  }
}

