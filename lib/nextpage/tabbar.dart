import 'package:flutter/material.dart';
import 'package:untitled/default_ui/next_page_preset_class.dart';
import 'package:untitled/navigation/home_page.dart';
import 'package:untitled/navigation/chat_page.dart';
import 'package:untitled/navigation/account_page.dart';

import 'package:untitled/resource/strings.dart';

class tabbar extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    Tab(text: '首頁'),
    Tab(text: '聊天室'),
    Tab(text: '個人資料'),
  ];

  final pages = [HomePage(), ChatPage(), AccountPage()];

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     appBar: AppBar(
    //       title: Text(strings.TabPage),
    //       bottom: TabBar(
    //         tabs: myTabs,
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: <Widget>[HomePage(), ChatPage(), AccountPage()],
    //     ));

    return DefaultTabController(
      length: myTabs.length, //選項卡頁數
      child: NextPagePresetClass(
        title: strings.TabPage,
        body: TabBarView(
          children: <Widget>[HomePage(), ChatPage(), AccountPage()],
        ),
        bottom: TabBar(
          tabs: myTabs,
        ),
      ),
    );

    // return MaterialApp(
    //   home: DefaultTabController(
    //     length: myTabs.length, //選項卡頁數
    //     child: Scaffold(
    //       appBar: AppBar(
    //         bottom: TabBar(
    //           tabs: myTabs,
    //         ),
    //       ),
    //       body: TabBarView(
    //         children: <Widget>[HomePage(), ChatPage(), AccountPage()],
    //       ),
    //     ),
    //   ),
    // );
  }
}
