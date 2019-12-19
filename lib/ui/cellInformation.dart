import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_community_web/common/commonHeader.dart';

class cellInformation extends StatefulWidget {
  @override
  _cellInformationState createState() => _cellInformationState();
}

class _cellInformationState extends State<cellInformation> {
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;

    Widget cellText = Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "小区名称: ",
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
          )
        ],
      ),
    );

    ///保存按钮
    Widget saveButtonArea = new Container(
      height: 45.0,
      child: Center(
        child: Container(
          child: new RaisedButton(
            color: Colors.green,
            child: Text(
              "保存",
              style: new TextStyle(color: Colors.white),
            ),
            //设置按钮圆角
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            onPressed: () {},
          ),
          margin: EdgeInsets.only(right: 10),
        ),
      ),
    );

    ///取消按钮
    Widget cancelButtonArea = new Container(
      height: 45.0,
      child: Center(
        child: Container(
          child: new RaisedButton(
            color: Colors.green,
            child: Text(
              "取消",
              style: new TextStyle(color: Colors.white),
            ),
            //设置按钮圆角
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            onPressed: () {},
          ),
          margin: EdgeInsets.only(right: 10),
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
            //使用公共的header，传入title
            commonHeader(
              title: "小区信息",
            ),
            Expanded(
              child: Container(
                width: 0.3 * _media.width,
                margin: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    cellText,
                    SizedBox(
                      height: 20,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        saveButtonArea,
                        SizedBox(
                          width: 10,
                        ),
                        cancelButtonArea,
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
