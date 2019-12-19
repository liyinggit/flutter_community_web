import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_community_web/common/commonHeader.dart';

class openRecord extends StatefulWidget {
  @override
  _openRecordState createState() => _openRecordState();
}

class _openRecordState extends State<openRecord> {
  String dropdownValue = '小区1';
  String dropdownValue2 = '大门1';

  final List<String> _allActivities = <String>[
    'hiking',
    'swimming',
    'boating',
    'fishing'
  ];
  String _activity = 'fishing';

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {

    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );

    setState(() {
      selectedDate = picked;
    });

  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;

    ///区域
    Widget positionArea = Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "区域: ",
          ),
          Container(
            width: 0.2 * _media.width,
            child: DropdownButtonHideUnderline(
              child: InputDecorator(
                decoration: const InputDecoration(
                  hintText: 'Choose an activity',
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
                  items: _allActivities
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Container(
            width: 0.2 * _media.width,
            margin: EdgeInsets.only(left: 10),
            child: DropdownButtonHideUnderline(
              child: InputDecorator(
                decoration: const InputDecoration(
                  hintText: 'Choose an activity',
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
                  items: _allActivities
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 0.2 * _media.width,
            child: DropdownButtonHideUnderline(
              child: InputDecorator(
                decoration: const InputDecoration(
                  hintText: 'Choose an activity',
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
                  items: _allActivities
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          )
        ],
      ),
    );

    ///设备号
    Widget deviceText = Container(
      width: 0.3 * _media.width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "设备号: ",
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

    ///时间选择
    Widget timeText = Container(
      width: 0.3 * _media.width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "时间: ",
          ),
          Container(
              margin: EdgeInsets.only(left: 10),
              width: 0.2 * _media.width,
              child: InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: DropdownButtonHideUnderline(
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.arrow_drop_down_circle)
                    ),
                  ),
                ),
              ))
        ],
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
              title: "开门记录",
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: <Widget>[
                    positionArea,
                    SizedBox(
                      height: 20,
                    ),
                    deviceText,
                    timeText
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
