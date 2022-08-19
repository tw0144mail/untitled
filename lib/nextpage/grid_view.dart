import 'package:flutter/material.dart';
import 'package:untitled/default_ui/next_page_preset_class.dart';
import 'package:untitled/resource/strings.dart';

class grid_view extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NextPagePresetClass(
      title: strings.GridElementPage,
      body: _grid_view(),
    );
  }
}

class _grid_view extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: BeveledRectangleBorder(),
                side: BorderSide(
                  width: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              // child: Text('按鈕' + '\n' + '$result'),
              child: new Text("測試一"),
              onPressed: () {
                // String name = "Wang";
                // Navigator.pushNamed(context, '/TwoPage', arguments: name);
              },
            ),
          ],
        ),
      ],
    );
  }
}

// new List.generate(50, (index) {
// return new Center(
// child: new Text(
// '測試資料 $index',
// ),
// );
// }),
