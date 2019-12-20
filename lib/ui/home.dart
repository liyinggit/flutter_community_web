import 'package:flutter/material.dart';
import 'package:flutter_community_web/common/adaptive.dart';

const appBarDesktopHeight = 60.0;

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isDesktop = isDisplayDesktop(context);
    final _media = MediaQuery.of(context).size;

    final body = SafeArea(
      child: Text("hello"),
    );

    if (isDesktop) {
      return Material(
          child: Container(
        height: _media.height,
        width: _media.width,
        child: Row(
          children: [
            ListDrawer(),
            VerticalDivider(width: 1),
            Expanded(
              child: Scaffold(
                appBar: AdaptiveAppBar(
                  isDesktop: isDesktop,
                  title: "ACME",
                ),
                body: body,
              ),
            )
          ],
        ),
      ));
    } else {
      return Container(
        width: _media.width,
        height: _media.height,
        child: Scaffold(
          appBar: AdaptiveAppBar(
            isDesktop: isDesktop,
            title: "ACME",
          ),
          drawer: ListDrawer(),
          body: body,
        ),
      );
    }
  }
}

///
class ListDrawer extends StatefulWidget {
  @override
  _ListDrawerState createState() => _ListDrawerState();
}

class _ListDrawerState extends State<ListDrawer> {
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;

    return Container(
        height: _media.height,
        child: Drawer(
          child: SafeArea(
            child: ListView(
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    "小区信息",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  backgroundColor: Colors.cyan.withOpacity(0.025),
                  children: <Widget>[
                    ListTile(
                      title: Text("小区列表"),
                      onTap: () {
                        Navigator.pushNamed(context, "cellList");
                      },
                    ),
                    ListTile(
                      title: Text("开门记录"),
                      onTap: () {
                        Navigator.pushNamed(context, "openRecord");
                      },
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "导入功能",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
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
        ));
  }
}

///appbar
class AdaptiveAppBar extends StatefulWidget implements PreferredSizeWidget {
  const AdaptiveAppBar({
    Key key,
    this.isDesktop,
    this.title,
  }) : super(key: key);

  final bool isDesktop;
  final String title;

  @override
  _AdaptiveAppBarState createState() => _AdaptiveAppBarState();

  @override
  Size get preferredSize => isDesktop
      ? const Size.fromHeight(appBarDesktopHeight)
      : const Size.fromHeight(kToolbarHeight);
}

class _AdaptiveAppBarState extends State<AdaptiveAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      centerTitle: true,
      title: Text(
        widget.title,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
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
              //清除之前的所有路由再push到新路由login上
              Navigator.pushNamedAndRemoveUntil(
                  context, "login", (Route route) => false);
            },
          ),
        ),
      ],
    );
  }
}
