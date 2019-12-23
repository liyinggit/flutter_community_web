import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_community_web/common/adaptive.dart';
import 'package:flutter_community_web/tree/organ.dart';
import 'package:flutter_community_web/tree/tree.dart';
import 'package:flutter_community_web/common/buttonArea.dart';

class Dessert {
  Dessert(this.address, this.name, this.phone, this.bind);

  final String address;
  final String name;
  final String phone;
  final String bind;
  bool selected = false;
}

class DessertDataSource extends DataTableSource {
  final List<Dessert> _desserts = <Dessert>[
    Dessert('祈福新村摘星阁A栋', '李华', '13888888888', '是'),
    Dessert('祈福新村摘星阁A栋', '李华', '13888888888', '是'),
    Dessert('祈福新村摘星阁A栋', '李华', '13888888888', '是'),
    Dessert('祈福新村摘星阁A栋', '李华', '13888888888', '是'),
    Dessert('祈福新村摘星阁A栋', '李华', '13888888888', '是'),
    Dessert('祈福新村摘星阁A栋', '李华', '13888888888', '是'),
    Dessert('祈福新村摘星阁A栋', '李华', '13888888888', '是'),
    Dessert('祈福新村摘星阁A栋', '李华', '13888888888', '是'),
  ];

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _desserts.length) return null;
    final Dessert dessert = _desserts[index];
    return DataRow.byIndex(
      index: index,
      selected: dessert.selected,
      onSelectChanged: (bool value) {
        if (dessert.selected != value) {
          _selectedCount += value ? 1 : -1;
          assert(_selectedCount >= 0);
          dessert.selected = value;
          notifyListeners();
        }
      },
      cells: <DataCell>[
        DataCell(Text('${dessert.address}')),
        DataCell(Text('${dessert.name}')),
        DataCell(Text('${dessert.phone}')),
        DataCell(Text('${dessert.bind}')),
        DataCell(Row(
          children: <Widget>[
            ButtonArea(title:"删除" ,),
            ButtonArea(title: "修改",)
          ],
        ))
      ],
    );
  }

  @override
  int get rowCount => _desserts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
    for (Dessert dessert in _desserts)
      dessert.selected = checked;
    _selectedCount = checked ? _desserts.length : 0;
    notifyListeners();
  }
}

class body extends StatefulWidget {
  @override
  _bodyState createState() => _bodyState();
}

class _bodyState extends State<body> {
  @override
  Widget build(BuildContext context) {
    int _rowsPerPage = 5;
    final DessertDataSource _dessertsDataSource = DessertDataSource();

    final bool isDesktop = isDisplayDesktop(context);
    final _media = MediaQuery.of(context).size;

    ///文本区域
    Widget textArea = Container(
      width: _media.width * 0.1,
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
    );

    ///顶部的区域络
    Widget topArea = Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(20.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("依云居  >  北区  >"),
          textArea,
          ButtonArea(
            title: "+",
          ),
          ButtonArea(
            title: "-",
          ),
        ],
      ),
    );

    ///一堆按钮
    Widget buttonArea = Container(
      alignment: Alignment.topLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ButtonArea(
            title: "删除",
          ),
          ButtonArea(
            title: "添加",
          ),
          ButtonArea(
            title: "导入",
          ),
          ButtonArea(
            title: "设备列表",
          )
        ],
      ),
    );

    ///table
    Widget userTable = Container(
      width: _media.width * 0.5,
      height: _media.height * 0.5,
      child: ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          PaginatedDataTable(
            header: const Text('业主信息'),
            rowsPerPage: _rowsPerPage,
            onSelectAll: _dessertsDataSource._selectAll,

            columns: <DataColumn>[
              DataColumn(
                label: const Text('地址'),
              ),
              DataColumn(
                label: const Text('业主姓名'),
              ),
              DataColumn(
                label: const Text('业主手机'),
              ),
              DataColumn(
                label: const Text('是否绑定'),
              ),
              DataColumn(
                label: const Text('操作'),
              ),
            ],
            source: _dessertsDataSource,
          ),
        ],
      ),
    );

    return Column(
      children: <Widget>[
        topArea,
        SizedBox(
          height: 20.0,
        ),
        buttonArea,
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child:userTable ,
        )

      ],
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
