import 'package:flutter/material.dart';
import 'package:untitled/default_ui/next_page_preset_class.dart';

import 'package:untitled/navigation/home_page.dart';
import 'package:untitled/navigation/chat_page.dart';
import 'package:untitled/navigation/account_page.dart';
import 'package:untitled/resource/strings.dart';



class drawer extends StatefulWidget {
  @override
  _MyAppDrawer createState() => _MyAppDrawer();
}

class _MyAppDrawer extends State<drawer> {
  //目前選擇頁索引值
  int _currentIndex = 0; //預設值

  final pages = [HomePage(), ChatPage(), AccountPage()];

  @override
  Widget build(BuildContext context) {
    return NextPagePresetClass(
        title: strings.DrawerPage,
        drawer:Drawer(
          child: ListView(
            children: <Widget>[
              //設定用户名稱
              UserAccountsDrawerHeader(
                accountName: new Text(
                  "拉基蛋",
                ),
                //設定Email
                accountEmail: new Text(
                  "tw0144mike@gmail.com",
                ),
                //設定大頭照
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new AssetImage("assets/images/logo.png"),
                ),
              ),
              //選單
              ListTile(
                leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
                title: Text('首頁'),
                onTap: () {
                  _onItemClick(0);
                },
              ),
              ListTile(
                leading: new CircleAvatar(child: Icon(Icons.code)),
                title: Text('聊天室'),
                onTap: () {
                  _onItemClick(1);
                },
              ),
              ListTile(
                leading: new CircleAvatar(child: Icon(Icons.computer)),
                title: Text('個人資料'),
                onTap: () {
                  _onItemClick(2);
                },
              ),
            ],
          ),
        ),
        body: pages[_currentIndex],
    );




    // return  Scaffold(
    //   appBar: AppBar(
    //     title: Text(strings.DrawerPage),
    //   ),
    //   drawer: Drawer(
    //     child: ListView(
    //       children: <Widget>[
    //         //設定用户名稱
    //         UserAccountsDrawerHeader(
    //           accountName: new Text(
    //             "拉基蛋",
    //           ),
    //           //設定Email
    //           accountEmail: new Text(
    //             "tw0144mike@gmail.com",
    //           ),
    //           //設定大頭照
    //           currentAccountPicture: new CircleAvatar(
    //             backgroundImage: new AssetImage("assets/images/logo.png"),
    //           ),
    //         ),
    //         //選單
    //         ListTile(
    //           leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
    //           title: Text('首頁'),
    //           onTap: () {
    //             _onItemClick(0);
    //           },
    //         ),
    //         ListTile(
    //           leading: new CircleAvatar(child: Icon(Icons.code)),
    //           title: Text('聊天室'),
    //           onTap: () {
    //             _onItemClick(1);
    //           },
    //         ),
    //         ListTile(
    //           leading: new CircleAvatar(child: Icon(Icons.computer)),
    //           title: Text('個人資料'),
    //           onTap: () {
    //             _onItemClick(2);
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    //   body: pages[_currentIndex],
    // );
  }

  void _onItemClick(int index) {
    setState(() {
      _currentIndex = index;
      Navigator.of(context).pop();
    });
  }
}