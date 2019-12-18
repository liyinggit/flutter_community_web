

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class content extends StatefulWidget {
  @override
  _contentState createState() => _contentState();
}

class _contentState extends State<content> {
  @override
  Widget build(BuildContext context) {

    var descTextStyle = new TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18.0,
      height: 2.0,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                "Starwberry Pavlova",
                style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight:FontWeight.bold
                ),
              ) ,
            ),
            Center(
              child: Text(
                "hello",
                style: new TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Icon(Icons.star,color: Colors.green[500],),
                    new Icon(Icons.star,color: Colors.green[500],),
                    new Icon(Icons.star,color: Colors.green[500],),
                    new Icon(Icons.star,color: Colors.green[500],),
                  ],
                ),
                new Text(
                  "170 views",
                  style: new TextStyle(
                    color: Colors.black,
                    fontSize:20,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                    fontFamily: 'Roboto'
                  ),
                ),

              ],
            ),

            DefaultTextStyle.merge(
              style: descTextStyle,
                child: new Container(
                  padding: new EdgeInsets.all(20.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Column(
                        children: <Widget>[
                          new Icon(Icons.kitchen,color: Colors.green,),
                          new Text("prep:"),
                          new Text("25min"),
                        ],
                      ),
                      new Column(
                        children: <Widget>[
                          new Icon(Icons.kitchen,color: Colors.green,),
                          new Text("prep:"),
                          new Text("25min"),
                        ],
                      ),
                      new Column(
                        children: <Widget>[
                          new Icon(Icons.kitchen,color: Colors.green,),
                          new Text("prep:"),
                          new Text("25min"),
                        ],
                      ),
                    ],
                  ),
                )
            )
          ],
        ),
        Container(
          child: Image.asset("images/lake.jpg"),
        ),
      ],
    );
  }
}
