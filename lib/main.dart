import 'dart:developer' as developer;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Integrate.dart';
import 'package:sprintf/sprintf.dart';
import 'package:untitled/common/global.dart';
import 'package:untitled/element/home_components.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/util/routers.dart';
import 'generated/l10n.dart';

void main() => Global.init().then((e) => runApp(MyApp()));
// void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final goRouter = Routes.RoutesGoRouter();
    try {
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xff2094F3),
          // systemNavigationBarDividerColor: Color(0xffffffff),
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarColor: Color(0xff2094F3),

          ///这是设置状态栏的图标和字体的颜色
          ///Brightness.light  一般都是显示为白色
          ///Brightness.dark 一般都是显示为黑色
          statusBarIconBrightness: Brightness.light //虚拟按键背景色

          );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    } catch (e) {
      print(e);
    }
    return MaterialApp.router(
      localizationsDelegates: const [
        // // 本地化的代理类
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
        // // 注册我们的Delegate
        // DemoLocalizationsDelegate()
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
        routerDelegate: goRouter.routerDelegate,
        routeInformationParser: goRouter.routeInformationParser,
        routeInformationProvider: goRouter.routeInformationProvider,
        // theme: ThemeData(
        //   primarySwatch: Colors.amber,
        // ),
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback: (_locale, supportedLocales) {
        //跟随系统
        Locale locale;
        if (supportedLocales.contains(_locale)) {
          locale = _locale!;
        } else {
          //如果系统语言不是中文简体或美国英语，则默认使用中文繁体
          locale = Locale('zh', 'TW'); // 中文繁体
        }
        return locale;
      },

      // localeListResolutionCallback: (locales, supportedLocales) {
      //   // startLocale: Locale('zh', 'CN');
      //   print('device locales=$locales supported locales=$supportedLocales');
      //   //
      //   // for (Locale locale in locales!) {
      //   //   // if device language is supported by the app, vc
      //   //   // just return it to set it as current app language
      //   //   print('device locales=$locales');
      //   //   if (supportedLocales.contains(locale)) {
      //   //     return locale;
      //   //   } else {
      //   //     String Stringlocales = locales.toString();
      //   //     Stringlocales = Stringlocales.replaceAll("[", "");
      //   //     Stringlocales = Stringlocales.replaceAll("]", "");
      //   //     List<String> Listlocales = Stringlocales.split(', ').toList();
      //   //     for (int x = 0; Listlocales.length > x; x++) {
      //   //       print('Listlocales[x]=' + Listlocales[x]);
      //   //       if (Listlocales[x].startsWith("en")) {
      //   //         return Locale('en');
      //   //       }
      //   //     }
      //   //   }
      //   // }
      //   //
      //   // // if device language is not supported by the app,
      //   // // the app will set it to english but return this to set to Bahasa instead
      //   // return  Locale('en');
      // },

      // locale: Locale('en', 'US'),
      // supportedLocales: const [
      //   Locale('en', 'US'), // 美国英语
      //   Locale('zh', 'CN'), // 中文简体
      //   Locale('zh', 'TW'), // 中文繁体
      //   //其它Locales
      // ],
      // locale: const Locale('zh', 'TW'), //手动指定locale

      title: "測試APP",
      // title: strings.myFormattedString.format('world'),
      debugShowCheckedModeBanner: false,
      // home: Scaffold(
      //   body: HomePage(contextHP: context),
      //   //注意是在 Scaffold 裡面喲!!
      //   floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      //   floatingActionButton: FloatingActionButton(
      //     child: Icon(Icons.add),
      //     onPressed: () {
      //       print('press...');
      //     },
      //   ),
      // ),
    );


  }
}


