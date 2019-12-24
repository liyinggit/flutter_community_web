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

    ///每个元素
    Widget item = Container(
      width: 0.6 * _media.width,
      height: 0.2 * _media.width,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 0.3 * _media.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "标题",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                    child: Text("这是一个副标题"),
                  ),
                ],
              ),
            ),
            Container(
              width: 0.1 * _media.width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
            ),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: _media.width,
            height: _media.height * 0.8,
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: item,
                );
              },
              itemCount: 5,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.white,
                  height: 10,
                );
              },
            ),
          ),
          Center(
            child: Container(
              width: 0.6 * _media.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10, color: Colors.black12, spreadRadius: 2)
                ],
                color: Colors.grey[500],
              ),
              child: IconButton(
                icon: Icon(Icons.add),
                color: Colors.green,
                iconSize: 100,
                onPressed: () {
                  Navigator.of(context).pushNamed("cellInformation");
                },
              ),
            ),
          )
        ],
      ),
    );
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
