import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class Menu {
  String title;
  IconData icon;

  Menu({this.title, this.icon});
}

List<Menu> menuItems = [
  Menu(title: "Dashboard", icon: Icons.dashboard),
  Menu(title: "Notifications", icon: Icons.notification_important),
  Menu(title: "Web UI", icon: Icons.web),
  Menu(title: "Charts", icon: Icons.insert_chart),
];

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    print(_media);

    Widget sideBarMenu = Container(
      width: 0.2 * _media.width,
      height: 0.9 *_media.height,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(blurRadius: 10, color: Colors.black12, spreadRadius: 2)
      ], color: Color(0xFF272D34)),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 0.1 * _media.height,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.kitchen,
                          color: Colors.white30,
                          size: 10,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "name",
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, counter) {
                return Divider(
                  height: 1,
                );
              },
              itemCount: menuItems.length,
            ),
          ),
        ],
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
              height: _media.height * 0.1,
              width: _media.width,
              child: AppBar(
                elevation: 4,
                centerTitle: true,
                title: Text(
                  "ACME",
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.white,
              ),
            ),
            Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  sideBarMenu,
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
