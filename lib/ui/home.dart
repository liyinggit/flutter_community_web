import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  bool collapsed = false;

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    print(_media);

    Widget sideBarMenu = Container(
      width: 0.2 * _media.width,
      height: 0.9 * _media.height,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(blurRadius: 10, color: Colors.black12, spreadRadius: 2)
      ], color: Colors.grey[500]),
      child: Scrollbar(
        child: ListView(
          children: <Widget>[
            ExpansionTile(
              title: Text(
                "小区信息",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
              backgroundColor: Colors.cyan.withOpacity(0.025),
              children: <Widget>[
                ListTile(
                  title: Text("小区列表"),
                ),
                ListTile(
                  title: Text("开门记录"),
                )
              ],
            ),
            ExpansionTile(
              title: Text(
                "导入功能",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
              backgroundColor: Colors.orangeAccent.withOpacity(0.025),
              children: <Widget>[
                ListTile(
                  title: Text("业主资料"),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                "设备运维",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
              backgroundColor: Colors.blue.withOpacity(0.025),
              children: <Widget>[
                ListTile(
                  title: Text("设备管理"),
                ),
                ListTile(
                  title: Text("维修管理"),
                ),
                ListTile(
                  title: Text("配置管理"),
                ),
                ListTile(
                  title: Text("设备类型配置"),
                ),
                ListTile(
                  title: Text("故障类型配置"),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return Material(
      child: Container(
        height: _media.height,
        width: _media.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: _media.width,
              child: AppBar(
                elevation: 4,
                centerTitle: true,
                title: Text(
                  "ACME",
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.white,
                leading: IconButton(
                  color: Colors.black,
                  icon: (collapsed) ? Icon(Icons.menu) : Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      collapsed = !collapsed;
                    });
                  },
                ),
                actions: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      color: Colors.amber,
                      child: Text(
                        "logout",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.popAndPushNamed(context, "login");
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  (collapsed) ? Container() : sideBarMenu,
                  Expanded(
                    child: Container(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
