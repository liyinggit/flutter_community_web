import 'package:flutter/material.dart';
import 'package:flutter_community_web/common/adaptive.dart';
import 'package:flutter_community_web/ui/home.dart';

class userInfo extends StatefulWidget {
  @override
  _userInfoState createState() => _userInfoState();
}

class _userInfoState extends State<userInfo> {
  final List<String> _allActivities = <String>['A栋', 'B栋', 'C栋'];
  String _activity;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = isDisplayDesktop(context);

    final _media = MediaQuery.of(context).size;

    ///选择下拉框
    Widget dropDownArea = Container(
      width: 0.2 * _media.width,
      margin: EdgeInsets.only(left: 10),
      child: DropdownButtonHideUnderline(
        child: InputDecorator(
          decoration: const InputDecoration(
            hintText: '请选择',
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(),
          ),
          isEmpty: _activity == null,
          child: DropdownButton<String>(
            value: _activity,
            onChanged: (String newValue) {
              setState(() {
                _activity = newValue;
              });
            },
            items: _allActivities.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );

    Widget topArea = Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(20.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("依云居  >  北区  >"),
          dropDownArea,
        ],
      ),
    );

    ///上传文件区域
    Widget uploadArea = Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ButtonArea(title: "选择文件",),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: "只能上传xls，xlsx，csv文件",
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
          ),
          ButtonArea(title: "添加",)
        ],
      ),
    );

    ///按钮区域
    Widget buttons = Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ButtonArea(title: "导入",),
          ButtonArea(title: "取消",)
        ],
      ),
    );


    Widget body = Container(
      child: Column(
        children: <Widget>[
          topArea,
          SizedBox(
            height: 20,
          ),
          uploadArea,
          SizedBox(
            height: 20.0,
          ),
          buttons,
        ],
      ),
    );

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
                  title: "业主信息",
                ),
                body: body,
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
            title: "业主信息",
          ),
          drawer: ListDrawer(),
          body: body,
        ),
      );
    };
  }
}

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
      ),
    );
  }
}

