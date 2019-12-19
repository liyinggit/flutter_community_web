
import 'package:flutter/material.dart';

void commonHeader(String text,context){
  final _media = MediaQuery.of(context).size;

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
  );
}