
import 'package:flutter/material.dart';

class One extends StatefulWidget {
  @override
  _OneState createState() => _OneState();
}

class _OneState extends State<One> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 333,
            color: Colors.amber.withAlpha(111),
            child: Navigator( // Navigator
//                initialRoute: '/abc',
                onGenerateRoute: (val) {
                  RoutePageBuilder builder;
                  switch (val.name) {
                    case 'Two':
                      builder = (BuildContext nContext, Animation<double> animation, Animation<double> secondaryAnimation) => Column(
                        // 并没有在 MaterialApp 中设定 /efg 路由
                        // 因为Navigator的特性 使用nContext 可以跳转 /efg
                        children: <Widget>[
                          Text('呵呵呵'),
                          RaisedButton(
                            child: Text('去 two'),
                            onPressed: () {
                              Navigator.pushNamed(nContext, 'Two');
                            },
                          )
                        ],
                      );
                      break;
                    default:
                      builder = (BuildContext nContext, Animation<double> animation, Animation<double> secondaryAnimation) => Center(
                          child: RaisedButton(
                            child: Text('去 two'),
                            onPressed: () {
                              Navigator.pushNamed(nContext, 'Two');
                            },
                          )
                      );
                  }
                  return PageRouteBuilder(
                    pageBuilder: builder,
                    // transitionDuration: const Duration(milliseconds: 0),
                  );
                },
                onUnknownRoute: (val) {
                  print(val);
                },
                observers: <NavigatorObserver>[]
            ),
          ),
        ],
      ),
    );
  }
}
