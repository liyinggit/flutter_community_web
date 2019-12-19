import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;

    print(_media);

    Widget phoneText = Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "账  号: ",
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

    Widget passwordText = Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "密  码: ",
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0))),
            ),
          )
        ],
      ),
    );

    Widget smsCodeText = Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "验证码: ",
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0))),
            ),
          ),
          Container(
            height: 45.0,
            margin: EdgeInsets.only(left: 10),
            child: RaisedButton(
              color: Colors.cyan,
              child: Text(
                "验证码",
                style: new TextStyle(color: Colors.white),
              ),
              //设置按钮圆角
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ],
      ),
    );

    ///登录按钮
    Widget loginButtonArea = new Container(
        height: 45.0,
        child: Center(
          child: Row(
            children: <Widget>[
              Container(
                child: new RaisedButton(
                  color: Colors.green,
                  child: Text(
                    "登录",
                    style: new TextStyle(color: Colors.white),
                  ),
                  //设置按钮圆角
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "home");
                  },
                ),
                margin: EdgeInsets.only(right: 10),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[new Text("忘记密码？"), new Text("请联系管理员")],
              ),
            ],
          ),
        ));

    ///屏幕宽度大的
    Widget LargeArea = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: _media.height * 0.2,
        ),
        Expanded(
            child: Container(
          //添加的背景图片
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            image: DecorationImage(
                image: NetworkImage(
                    "https://backgrounddownload.com/wp-content/uploads/2018/09/google-material-design-background-6.jpg"),
                fit: BoxFit.cover),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: _media.width * 0.6,
                  child: Center(
                    child: new Text(
                      "SYSTEM",
                      style:
                          TextStyle(fontSize: 80, fontWeight: FontWeight.w400),
                    ),
                  )),
              Container(
                width: _media.width * 0.2,
                margin: EdgeInsets.only(
                    left: _media.width * 0.1, right: _media.width * 0.1),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    phoneText,
                    passwordText,
                    smsCodeText,
                    loginButtonArea
                  ],
                ),
              ),
            ],
          ),
        )),
        SizedBox(
          height: _media.height * 0.3,
        ),
      ],
    );

    ///屏幕宽度小的
    Widget SmallArea = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: _media.height * 0.15,
        ),
        Container(
          width: _media.width * 0.8,
          child: Center(
            child: new Text(
              "SYSTEM",
              style: TextStyle(fontSize: 80, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              image: DecorationImage(
                  image: NetworkImage(
                      "https://backgrounddownload.com/wp-content/uploads/2018/09/google-material-design-background-6.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Container(
//              width: _media.width * 0.5,
              margin: EdgeInsets.all(0.1 * _media.width),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  phoneText,
                  SizedBox(
                    height: 10,
                  ),
                  passwordText,
                  SizedBox(
                    height: 10,
                  ),
                  smsCodeText,
                  SizedBox(
                    height: 10,
                  ),
                  loginButtonArea
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: _media.height * 0.15,
        ),
      ],
    );

    return new Scaffold(
      body: (_media.height >= 800)
          ? Container(
              width: _media.width,
              height: _media.height,
              child: (_media.width >= 1200) ? LargeArea : SmallArea,
            )
          : Text("too small"),
    );
  }
}
