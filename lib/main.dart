import 'package:flutter/material.dart';
import 'package:flutter_community_web/study/content.dart';
import 'package:flutter_community_web/ui/home.dart';
import 'package:flutter_community_web/ui/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,  //去除右上角的debug标签
      theme: new ThemeData(primaryColor: Colors.grey), //主题颜色
      home: home(),
      routes: <String,WidgetBuilder>{
        "login":(BuildContext context) => login(),
        "home":(BuildContext context) => home(),

        //学习的部分
        "content":(BuildContext context) =>content(),
      },
    );
  }
}

