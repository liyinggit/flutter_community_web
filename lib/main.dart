import 'package:flutter/material.dart';
import 'package:flutter_community_web/study/One.dart';
import 'package:flutter_community_web/study/Two.dart';
import 'package:flutter_community_web/study/content.dart';
import 'package:flutter_community_web/ui/cellInformation.dart';
import 'package:flutter_community_web/ui/cellList.dart';
import 'package:flutter_community_web/ui/home.dart';
import 'package:flutter_community_web/ui/login.dart';
import 'package:flutter_community_web/ui/openRecord.dart';

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
        //小区列表
        "cellInformation": (BuildContext context) => cellInformation(),
        //小区信息编辑
        "openRecord": (BuildContext context) => openRecord(),

        //学习的部分
        "content": (BuildContext context) => content(),
        "Two": (BuildContext context) => Two(),
      },
//      onGenerateRoute: (RouteSettings settings) {
//        return MaterialPageRoute(builder: (context) {
//          String routeName = settings.name;
//          print(routeName);
//          // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
//          // 引导用户登录；其它情况则正常打开路由。
//        });
//      },
    );
  }
}
