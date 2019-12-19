import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cellList extends StatefulWidget {
  @override
  _cellListState createState() => _cellListState();
}

class _cellListState extends State<cellList> {
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    print(_media);

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
                  Icon(
                    Icons.border_color,
                    color: Colors.cyan,
                  ),
                  Icon(
                    Icons.business,
                    color: Colors.green,
                  ),
                  Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  )
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

    return Material(
      child: Container(
        width: _media.width,
        height: _media.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: _media.width,
              child: AppBar(
                elevation: 4,
                centerTitle: true,
                title: Text(
                  "小区列表",
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.white,
                leading: IconButton(
                  color: Colors.black,
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Navigator.of(context).pop();
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
                        //清除之前的所有路由再push到新路由login上
                        Navigator.pushNamedAndRemoveUntil(
                            context, "login", (Route route) => false);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: _media.width,
                height: _media.height,
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
                                blurRadius: 10,
                                color: Colors.black12,
                                spreadRadius: 2)
                          ],
                          color: Colors.grey[500],
                        ),
                        child: IconButton(
                          icon: Icon(Icons.add),
                          color: Colors.green,
                          iconSize: 100,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
