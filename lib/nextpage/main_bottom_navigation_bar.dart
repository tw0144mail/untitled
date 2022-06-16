import 'package:flutter/material.dart';
import 'package:untitled/default_ui/next_page_preset_class.dart';
import 'package:untitled/navigation/home_page.dart';
import 'package:untitled/navigation/chat_page.dart';
import 'package:untitled/navigation/account_page.dart';

import 'package:untitled/navigation/home_page2.dart';
import 'package:untitled/navigation/chat_page2.dart';
import 'package:untitled/navigation/account_page2.dart';

import 'package:untitled/navigation/home_page3.dart';
import 'package:untitled/navigation/chat_page3.dart';
import 'package:untitled/navigation/account_page3.dart';
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

class main_bottom_navigation_bar extends StatefulWidget {
  main_bottom_navigation_bar({Key? key}) : super(key: key);

  @override
  _BottomNavigationControllerState createState() =>
      _BottomNavigationControllerState();
}

class _BottomNavigationControllerState
    extends State<main_bottom_navigation_bar> {
  //目前選擇頁索引值
  int _currentIndex = 0; //預設值
  int _currentIndex2 = 0;
  int _currentIndex3 = 0;
  final pages = [HomePage(), ChatPage(), AccountPage()];
  final pages2 = [HomePage2(), ChatPage2(), AccountPage2()];
  final pages3 = [HomePage3(), ChatPage3(), AccountPage3()];

  @override
  Widget build(BuildContext context) {
    return NextPagePresetClass(
      title: strings.GuidePage,
      body: Column(children: <Widget>[
        SizedBox(
            width: 200.0, //宽度为200
            height: 200.0, //高度为200
            child: Scaffold(
              body: pages[_currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: '首頁'),
                  BottomNavigationBarItem(icon: Icon(Icons.chat), label: '聊天室'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle), label: '個人資料'),
                ],
                currentIndex: _currentIndex, //目前選擇頁索引值
                fixedColor: Colors.amber, //選擇頁顏色
                onTap: _onItemClick, //BottomNavigationBar 按下處理事件
              ),
            )),
        SizedBox(
            width: 200.0, //宽度为200
            height: 200.0, //高度为200
            child: Scaffold(
              body: pages2[_currentIndex2],
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: '首頁'),
                  BottomNavigationBarItem(icon: Icon(Icons.chat), label: '聊天室'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle), label: '個人資料'),
                ],
                currentIndex: _currentIndex2, //目前選擇頁索引值
                fixedColor: Colors.amber, //選擇頁顏色
                onTap: _onItemClick2, //BottomNavigationBar 按下處理事件
              ),
            )),
        SizedBox(
            width: 200.0, //宽度为200
            height: 200.0, //高度为200
            child: Scaffold(
              body: pages3[_currentIndex3],
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: '首頁'),
                  BottomNavigationBarItem(icon: Icon(Icons.chat), label: '聊天室'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle), label: '個人資料'),
                ],
                currentIndex: _currentIndex3, //目前選擇頁索引值
                fixedColor: Colors.amber, //選擇頁顏色
                onTap: _onItemClick3, //BottomNavigationBar 按下處理事件
              ),
            )),
        Text("測試"),
      ]),
    );
  }

  //BottomNavigationBar 按下處理事件，更新設定當下索引值
  void _onItemClick(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onItemClick2(int index) {
    setState(() {
      _currentIndex2 = index;
    });
  }

  void _onItemClick3(int index) {
    setState(() {
      _currentIndex3 = index;
    });
  }
}
