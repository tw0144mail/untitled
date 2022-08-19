import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

/**
 * 路由跳轉
 * Created by xiaocheng123
 * Date: 2019-7-8
 */
class NavigatorUtil {

  ///替換
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  ///切換無引數頁面
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  // ///主頁
  // static goHome(BuildContext context) {
  //   Navigator.pushReplacementNamed(context, HomePage.sName);
  // }

  // ///登入頁
  // static goLogin(BuildContext context) {
  //   // Navigator.pushReplacementNamed(context, LoginPage.sName);
  //   Navigator.of(context).pushAndRemoveUntil(
  //       new MaterialPageRoute(builder: (context) => new LoginPage()
  //       ), (route) => route == null);
  // }
  //
  // ///新手設定頁面
  // static goNoobSetting(BuildContext context) {
  //   Navigator.of(context).push(CustomRoute(NoobSettingPage()));
  // }

  // ///意見反饋設定頁面
  // static goUserIdea(BuildContext context) {
  //   Navigator.push(context,
  //       new CupertinoPageRoute(builder: (context) => pageContainer(UserIdeaPage())));
  // }

  ///公共開啟方式
  static NavigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(context,
        new CupertinoPageRoute(builder: (context) => pageContainer(widget)));
  }

  ///Page頁面的容器，做一次通用自定義
  static Widget pageContainer(widget) {
    return MediaQuery(

      ///不受系統字型縮放影響
        data: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .copyWith(textScaleFactor: 1),
        child: widget);
  }
}