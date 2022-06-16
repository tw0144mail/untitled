import 'package:flutter/material.dart';
import 'package:untitled/default_ui/next_page_preset_class.dart';
import 'package:untitled/resource/strings.dart';

class table extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NextPagePresetClass(
      title: strings.TableElementPage,
      body:_table(),
    );
  }
}

class _table extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Table(
        columnWidths: const <int, TableColumnWidth>{
          //指定索引及固定列宽
          0: FixedColumnWidth(100.0),
          1: FixedColumnWidth(50.0),
          2: FixedColumnWidth(180.0),
        },
        //設定表格樣式
        border: TableBorder.all(
            color: Colors.black87, width: 2.0, style: BorderStyle.solid),
        children: const <TableRow>[
          TableRow(
            children: <Widget>[
              Text('課程名稱'),
              Text('講師'),
              Text('上課時間'),
            ],
          ),
          TableRow(
            children: <Widget>[
              Text('JAVA'),
              Text('浩浩'),
              Text('每週 一、三 21:00~22:00'),
            ],
          ),
          TableRow(
            children: <Widget>[
              Text('kotlin'),
              Text('浩浩'),
              Text('每週 二、四 21:00~22:00'),
            ],
          ),
          TableRow(
            children: <Widget>[
              Text('Dart'),
              Text('浩浩'),
              Text('每週 六 10:00~11:00'),
            ],
          ),
        ],
      ),
    );
  }
}
