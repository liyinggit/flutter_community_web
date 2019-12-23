import 'package:flutter/material.dart';
import 'package:flutter_community_web/common/adaptive.dart';
import 'package:flutter_community_web/tree/organ.dart';
import 'package:flutter_community_web/tree/tree.dart';

class body extends StatefulWidget {
  @override
  _bodyState createState() => _bodyState();
}

class _bodyState extends State<body> {
  @override
  Widget build(BuildContext context) {
    final bool isDesktop = isDisplayDesktop(context);
    final _media = MediaQuery.of(context).size;

    Widget topArea = Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(20.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("依云居  >  北区  >"),
        ],
      ),
    );

    return Column(
      children: <Widget>[topArea],
    );
  }
}

class addInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isDesktop = isDisplayDesktop(context);
    final _media = MediaQuery.of(context).size;
    return Container(
      width: _media.width,
      height: _media.height,
      child: Row(
        children: <Widget>[
          Container(
            width: _media.width * 0.2,
            child: Tree(_buildData()),
          ),
          body()
        ],
      ),
    );
  }

  List<Organ> _buildData() {
    return [
      Organ([
        Organ(
          null,
          [
            Member("A"),
            Member("B"),
            Member("C"),
          ],
          "A栋",
        ),
        Organ(
          null,
          [
            Member("A"),
            Member("B"),
            Member("C"),
          ],
          "B栋",
        ),
        Organ(
          null,
          [
            Member("A"),
            Member("B"),
            Member("C"),
          ],
          "c栋",
        ),
        Organ(
          null,
          [
            Member("A"),
            Member("B"),
            Member("C"),
          ],
          "D栋",
        ),
      ], null, "依云居"),
      Organ(
          null,
          [
            Member("A栋"),
            Member("B栋"),
            Member("C栋"),
            Member("D栋"),
          ],
          "摘星阁")
    ];
  }
}
