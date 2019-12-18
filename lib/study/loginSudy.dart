
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class loginStudy extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<loginStudy> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image:AssetImage('images/lake.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),
          GestureDetector(
            onTap: (){
            },
          ),
          _buildLogInWidgets(),
        ],
      )
    );
  }

  _buildLogInWidgets() {
    Color mainColor = Colors.black;
    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, //垂直方向对其方式
      crossAxisAlignment: CrossAxisAlignment.end, //水平方向对其方式

      children: <Widget>[
        Center(
          child: new Container(
            child: Center(
              child: new CircleAvatar(
                  backgroundImage: AssetImage("images/lake.jpg"),
              ),
            ),
          ),
        ),
        new Center(
          child: new Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: new TextField(
                      style: TextStyle(color: Colors.black),
                      cursorColor: mainColor,
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(
                        hintText: '用户名',
                        hintStyle: TextStyle(color: mainColor),
                        errorStyle: TextStyle(color: Colors.teal),
                        icon: new Icon(Icons.people, color: mainColor),
                      ),
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: new TextField(
                      style: TextStyle(color: Colors.black),
                      cursorColor: mainColor,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(
                        hintText: '密码',
                        hintStyle: TextStyle(color: mainColor),
                        errorStyle: TextStyle(color: Colors.teal),
                        icon: new Icon(Icons.lock_outline, color: mainColor),
                      ),
                    ),
                  )
                ]),
          ),
        ),
        new Center(
            child: new Column(
              children: <Widget>[
                new Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: new Material(
                    child: new FlatButton(
                      child: new Container(
                        child: new Center(
                            child: new Text(
                              "登录",
                              textScaleFactor: 1.5,
                              style: new TextStyle(
                                  color: Colors.white, fontFamily: "Roboto"),
                            )),
                      ),
                    ),
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10.0),
                    elevation: 5.0,
                  ),
                ),
                new Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: new FlatButton(
                        child: new Text("没有帐户？ 注册",
                            style: new TextStyle(color: Colors.teal)),
                      ),
                    )),
              ],
            )),
      ],
    );
  }
}

