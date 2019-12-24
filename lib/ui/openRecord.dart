import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_community_web/common/adaptive.dart';
import 'package:intl/intl.dart';

import 'home.dart';

class Dessert {
  Dessert(this.openerId, this.deviceId, this.type, this.address, this.time,
      this.status);

  final String openerId;
  final String deviceId;
  final String type;
  final String address;
  final String time;
  final String status;

  bool selected = false;
}

class DessertDataSource extends DataTableSource {
  final List<Dessert> _desserts = <Dessert>[
    Dessert('1', 'D201990', '刷卡', '祈福新村摘星阁A栋', '2019-12-16 12:00', '待审批'),
    Dessert('2', 'D201990', '人脸', '祈福新村摘星阁A栋', '2019-12-16 12:00', '同意'),
    Dessert('3', 'D201990', '密码', '祈福新村摘星阁A栋', '2019-12-16 12:00', '拒绝'),
    Dessert('4', 'D201990', '一键开门', '祈福新村摘星阁A栋', '2019-12-16 12:00', '同意'),
    Dessert('5', 'D201990', '一键开门', '祈福新村摘星阁A栋', '2019-12-16 12:00', '同意'),
    Dessert('1', 'D201990', '刷卡', '祈福新村摘星阁A栋', '2019-12-16 12:00', '待审批'),
    Dessert('2', 'D201990', '人脸', '祈福新村摘星阁A栋', '2019-12-16 12:00', '同意'),
    Dessert('3', 'D201990', '密码', '祈福新村摘星阁A栋', '2019-12-16 12:00', '拒绝'),
    Dessert('4', 'D201990', '一键开门', '祈福新村摘星阁A栋', '2019-12-16 12:00', '同意'),
    Dessert('5', 'D201990', '一键开门', '祈福新村摘星阁A栋', '2019-12-16 12:00', '同意'),
    Dessert('1', 'D201990', '刷卡', '祈福新村摘星阁A栋', '2019-12-16 12:00', '待审批'),
    Dessert('2', 'D201990', '人脸', '祈福新村摘星阁A栋', '2019-12-16 12:00', '同意'),
    Dessert('3', 'D201990', '密码', '祈福新村摘星阁A栋', '2019-12-16 12:00', '拒绝'),
    Dessert('4', 'D201990', '一键开门', '祈福新村摘星阁A栋', '2019-12-16 12:00', '同意'),
    Dessert('5', 'D201990', '一键开门', '祈福新村摘星阁A栋', '2019-12-16 12:00', '同意'),
  ];

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _desserts.length) return null;
    final Dessert dessert = _desserts[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${dessert.openerId}')),
        DataCell(Text('${dessert.deviceId}')),
        DataCell(Text('${dessert.type}')),
        DataCell(Text('${dessert.address}')),
        DataCell(Text('${dessert.time}')),
        DataCell(Text('${dessert.status}')),
      ],
    );
  }

  @override
  int get rowCount => _desserts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

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

  DateTime _fromDate = DateTime.now();
  DateTime _toDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = isDisplayDesktop(context);

    final _media = MediaQuery.of(context).size;

    int _rowsPerPage = 5;
    final DessertDataSource _dessertsDataSource = DessertDataSource();

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

    ///区域
    Widget positionArea = Container(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "区  域: ",
          ),
          dropDownArea,
          dropDownArea,
          dropDownArea,
        ],
      ),
    );

    ///设备号
    Widget deviceText = Container(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "设备号: ",
          ),
          FittedBox(
            child: Container(
              width: _media.width * 0.2,
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
          )
        ],
      ),
    );

    ///时间选择
    Widget timeText = Container(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "时  间: ",
          ),
          Container(
            child: _DateTimePicker(
              width: 0.2 * _media.width,
              selectedDate: _fromDate,
              selectDate: (DateTime date) {
                setState(() {
                  _fromDate = date;
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text("~"),
          ),
          Container(
            child: _DateTimePicker(
              width: 0.2 * _media.width,
              selectedDate: _toDate,
              selectDate: (DateTime date) {
                setState(() {
                  _toDate = date;
                });
              },
            ),
          ),
        ],
      ),
    );

    ///开门记录table
    Widget openRecordTable = Container(
      alignment: Alignment.centerLeft,
      height: _media.height * 0.8,
      child: ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          PaginatedDataTable(
            header: const Text('开门记录'),
            rowsPerPage: _rowsPerPage,
            columns: <DataColumn>[
              DataColumn(
                label: const Text('开门者id'),
              ),
              DataColumn(
                label: const Text('设备号'),
              ),
              DataColumn(
                label: const Text('开门方式'),
              ),
              DataColumn(
                label: const Text('设备地址'),
              ),
              DataColumn(
                label: const Text('来访时间'),
              ),
              DataColumn(
                label: const Text('状态'),
              ),
            ],
            source: _dessertsDataSource,
          ),
        ],
      ),
    );

    ///主要的内容
    Widget body = Container(
        width: (isDesktop) ? _media.width * 0.8 : _media.width,
        margin: EdgeInsets.only(top: 20, left: 10),
        child: ListView(
          children: <Widget>[
            positionArea,
            SizedBox(
              height: 20,
            ),
            deviceText,
            SizedBox(
              height: 20,
            ),
            timeText,
            SizedBox(
              height: 20,
            ),
            openRecordTable
          ],
        ));

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
                  title: "开门记录",
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
            title: "开门记录",
          ),
          drawer: ListDrawer(),
          body: body,
        ),
      );
    }
  }
}

///日期选择框
class _DateTimePicker extends StatelessWidget {
  const _DateTimePicker({
    Key key,
    this.width,
    this.selectedDate,
    this.selectDate,
  }) : super(key: key);

  final double width;
  final DateTime selectedDate;
  final ValueChanged<DateTime> selectDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) selectDate(picked);
    print("选择的时间: $picked");
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle valueStyle = Theme.of(context).textTheme.title;
    return Container(
      margin: EdgeInsets.only(left: 10),
      width: width,
      child: InkWell(
        onTap: () {
          _selectDate(context);
        },
        child: DropdownButtonHideUnderline(
          child: InputDecorator(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.arrow_drop_down_circle),
            ),
            baseStyle: valueStyle,
            child: Text(DateFormat.yMMMd().format(selectedDate), style: valueStyle),
          ),
        ),
      ),
    );
  }
}
