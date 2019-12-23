import 'package:flutter/material.dart';

///button
class ButtonArea extends StatefulWidget {
  final String title;

  const ButtonArea({
    Key key,
    @required this.title,
  }) : super(key: key);
  @override
  _ButtonAraState createState() => _ButtonAraState();
}

class _ButtonAraState extends State<ButtonArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      margin: EdgeInsets.only(left: 10),
      child: RaisedButton(
        color: Colors.cyan,
        child: Text(
          widget.title,
          style: new TextStyle(color: Colors.white),
        ),
        //设置按钮圆角
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        onPressed: (){

        },
      ),
    );
  }
}