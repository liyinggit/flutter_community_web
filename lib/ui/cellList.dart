import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_community_web/common/adaptive.dart';
import 'package:flutter_community_web/ui/addInfo.dart';
import 'package:flutter_community_web/ui/cellInformation.dart';
import 'package:flutter_community_web/ui/home.dart';

class body extends StatefulWidget {
  @override
  _bodyState createState() => _bodyState();
}

class _bodyState extends State<body> {
  @override
  Widget build(BuildContext context) {
    final bool isDesktop = isDisplayDesktop(context);
    final _media = MediaQuery.of(context).size;
    print(_media);

    ///电脑图标区域
    Widget iconsAreaDeskTop = Container(
      width: 0.1 * _media.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.border_color,
              color: Colors.cyan,
            ),
            onPressed: () {
              Navigator.pushNamed(context, "cellInformation");
            },
          ),
          IconButton(
            icon: Icon(
              Icons.business,
              color: Colors.green,
            ),
            onPressed: () {
              Navigator.pushNamed(context, "addInfo");
            },
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.redAccent,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );

    ///手机图标区域
    Widget iconsAreaPhone = Container(
      width: 0.1 * _media.width,
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.border_color,
              color: Colors.cyan,
            ),
            onPressed: () {
              Navigator.pushNamed(context, "cellInformation");
            },
            iconSize: 20,
          ),
          IconButton(
            icon: Icon(
              Icons.business,
              color: Colors.green,
            ),
            onPressed: () {
              Navigator.pushNamed(context, "addInfo");
            },
            iconSize: 20,
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.redAccent,
            ),
            onPressed: () {},
            iconSize: 20,
          ),
        ],
      ),
    );

    ///每个元素
    Widget item = Container(
      width: (isDesktop) ? 0.6 * _media.width : 0.9 * _media.width,
      constraints: BoxConstraints(minHeight: 100),
      margin: EdgeInsets.all(20.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: (isDesktop) ? 0.2 * _media.width : 0.3 * _media.width,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:
                        (isDesktop) ? EdgeInsets.all(20) : EdgeInsets.all(10),
                    child: Text(
                      "标题",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  Padding(
                    padding: (isDesktop)
                        ? EdgeInsets.fromLTRB(20, 0, 0, 20)
                        : EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: Text("这是一个副标题"),
                  ),
                ],
              ),
            ),
            (isDesktop) ? iconsAreaDeskTop : iconsAreaPhone,
            Container(
              width: 0.2 * _media.width,
              height: 0.2 * _media.width,
              child: ClipRect(
                child: Image.asset("images/lake.jpg"),
              ),
            ),
          ],
        ),
      ),
    );

    Widget body = Container(
        width: _media.width,
        height: _media.height * 0.8,
        child: Scaffold(
          body: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: item,
              );
            },
            itemCount: 10,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Colors.white,
                height: 5,
              );
            },
          ),
          floatingActionButton: (isDesktop)
              ? FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushNamed(context, "cellInformation");
                  },
                  label: Text(
                    "添加",
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )
              : FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "cellInformation");
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.lightBlue,
                  ),
                ),
        ));
    return body;
  }
}

class cellList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isDesktop = isDisplayDesktop(context);
    final _media = MediaQuery.of(context).size;

    if (isDesktop) {
      return Container(
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
                  title: "小区列表",
                ),
                body: Navigator(
                  initialRoute: 'cellList',
                  onGenerateRoute: (RouteSettings settings) {
                    WidgetBuilder builder;
                    switch (settings.name) {
                      case 'cellList':
                        builder = (BuildContext _) => body();
                        break;
                      case 'cellInformation':
                        builder = (BuildContext _) => cellInformation();
                        break;
                      case "addInfo":
                        builder = (BuildContext _) => addInfo();
                        break;
                      default:
                        throw Exception('Invalid route: ${settings.name}');
                    }
                    return MaterialPageRoute(
                        builder: builder, settings: settings);
                  },
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        width: _media.width,
        height: _media.height,
        child: Scaffold(
          appBar: AdaptiveAppBar(
            isDesktop: isDesktop,
            title: "小区列表",
          ),
          drawer: ListDrawer(),
          body: Navigator(
            initialRoute: 'cellList',
            onGenerateRoute: (RouteSettings settings) {
              WidgetBuilder builder;
              switch (settings.name) {
                case 'cellList':
                  builder = (BuildContext _) => body();
                  break;
                case 'cellInformation':
                  builder = (BuildContext _) => cellInformation();
                  break;
                case "addInfo":
                  builder = (BuildContext _) => addInfo();
                  break;
                default:
                  throw Exception('Invalid route: ${settings.name}');
              }
              return MaterialPageRoute(builder: builder, settings: settings);
            },
          ),
        ),
      );
    }
  }
}
