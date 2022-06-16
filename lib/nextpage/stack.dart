import 'package:flutter/material.dart';
import 'package:untitled/default_ui/next_page_preset_class.dart';
import 'package:untitled/resource/strings.dart';
// class main_bottom_navigation_bar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: BottomNavigationController(),
//       ),
//     );
//   }
// }

class stack extends StatefulWidget {
  stack({Key? key}) : super(key: key);

  @override
  _Stack createState() => _Stack();
}

class _Stack extends State<stack> {
  @override
  Widget build(BuildContext context) {
    return NextPagePresetClass(
      title: strings.StackComponentsPage,
      body:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(alignment: Alignment.center, children: <Widget>[
              Container(
                color: Colors.amber,
                child: Text('111', style: TextStyle(fontSize: 100)),
              ),
              Container(
                color: Colors.red,
                child: Text('222', style: TextStyle(fontSize: 50)),
              )
            ]),
          ])

    );
  }
}
