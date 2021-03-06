import 'package:flutter/material.dart';
import 'package:flutter_community_web/study/SignUpPage.dart';
import 'package:flutter_community_web/study/Two.dart';
import 'package:flutter_community_web/study/content.dart';
import 'package:flutter_community_web/ui/cellList.dart';
import 'package:flutter_community_web/ui/home.dart';
import 'package:flutter_community_web/ui/login.dart';
import 'package:flutter_community_web/ui/openRecord.dart';
import 'package:flutter_community_web/ui/userInfo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      //去除右上角的debug标签
      home: login(),
      routes: <String, WidgetBuilder>{
        "login": (BuildContext context) => login(),
        //登录页面
        "home": (BuildContext context) => home(),
        //主页
        "cellList": (BuildContext context) => cellList(),
        //小区信息编辑
        "openRecord": (BuildContext context) => openRecord(),
        //业主信息
        "userInfo": (BuildContext context) => userInfo(),

        //学习的部分
        "content": (BuildContext context) => content(),
        "Two": (BuildContext context) => Two(),
        'SignUpPage': (BuildContext context) => SignUpPage(),
      },
    );
  }
}
