import 'dart:developer' as developer;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Integrate.dart';
import 'package:sprintf/sprintf.dart';
import 'package:untitled/common/global.dart';
import 'package:untitled/element/home_components.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/widgets.dart';
import 'generated/l10n.dart';

void main() => Global.init().then((e) => runApp(MyApp()));
// void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
    return MaterialApp(
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
      home: Scaffold(
        body: HomePage(contextHP: context),
        //注意是在 Scaffold 裡面喲!!
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print('press...');
          },
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
    required this.contextHP,
  }) : super(key: key);

  final BuildContext contextHP;

  @override
  _OnePage createState() => _OnePage();
}

class _OnePage extends State<HomePage> {
  var result = "0";
  String passWord = "0";
  late List<Container> containerList;
  String _content = " ";

  List<HomeComponents> HomeComponentsList = [
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.CustomPaintRoutePage]),
        nextPage: CustomPaintRoute()),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.NextPage]),
        nextPage: main_bottom_navigation_bar()),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.WithChunksPage]),
        nextPage: WithChunks()),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.SocketRoutePage]),
        nextPage: SocketRoute()),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.GuidePage]),
        nextPage: main_bottom_navigation_bar()),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.TabPage]),
        nextPage: tabbar()),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.DrawerPage]),
        nextPage: drawer()),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.StackComponentsPage]),
        nextPage: stack()),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.ListPage]),
        nextPage: list_view()),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.GridElementPage]),
        nextPage: grid_view()),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.TableElementPage]),
        nextPage: table()),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.DynamicGenerationPage]),
        nextPage: DynamicGeneration()),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.MixedPage]),
        nextPage: GradientButtonRoute()),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.TurnBoxPage]),
        nextPage: TurnBoxRoute()),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.GradientCircularPage]),
        nextPage: GradientCircularProgressRoute()),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.CustomCheckboxPage]),
        nextPage: CustomCheckboxTest()),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.DoneWidgetTestPage]),
        nextPage: DoneWidgetTest()),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.WaterMarkPage]),
        nextPage: WaterMark()),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.WaterMarkTestPage]),
        nextPage: WaterMarkTest()),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.FileOperationRoutePage]),
        nextPage: FileOperationRoute()),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.HttpTestRoutePage]),
        nextPage: HttpTestRoute()),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.FutureBuilderRouteStatePage]),
        nextPage: FutureBuilderRouteState()),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.WebSocketsPage]),
        nextPage: WebSocketRoute()),
  ];

// Randomly colored Container
  Container createNewbtn(int type) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            // child: Text('按鈕' + '\n' + '$result'),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
              child: Text(HomeComponentsList[type].getTitle()!),
            ),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
            onPressed: () {
              // String name = "Wang";
              // Navigator.pushNamed(context, '/TwoPage', arguments: name);
              if (HomeComponentsList[type].getTitle()! ==
                  sprintf(strings.GoTo, [strings.NextPage])) {
                final Product product = Product(
                    name: "產品名稱xxx", desc: "產品內容xxx", price: 0, stock: 66);
                toTheNextPage(context, main2(product: product));
              } else {
                toTheNextPage(context, HomeComponentsList[type].nextPage!);
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    containerList = [];
    replace(context);
    for (int i = 0; i <= HomeComponentsList.length - 1; i++) {
      mainaddContainer(i);
    }
    print('result $result');
    if (result != null &&
        result != "null" &&
        result != "0" &&
        result != "沒按過") {
      result = sprintf(strings.NPressed, [result]);
    } else {
      result = "沒按過";
    }
    Locale myLocale = Localizations.localeOf(context);

    return Scaffold(
        appBar: AppBar(
          // title: Text(DemoLocalizations.of(context)!.title),
          title: Text(S.of(context).title),
          // title: new Text(sprintf(strings.myFormattedString, ["World"])),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Center(
            child: ListView(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  child: Text('訂閱' + _content),
                  onPressed: () {
                    Global.textContent = "真的可以這樣嗎？";
                    //還真的
                    developer.log("Global.textContent" + Global.textContent);
                    // EventBusUtils.getInstance().fire(
                    //     MyEventBusString(code: 3345678, data: "main跨頁測試中～"));
                    // EventBusUtils.getInstance()
                    //     .on<MyEventBusString>()
                    //     .listen((event) {
                    //   _content = (event.data == null ? " " : event.data!);
                    //   setState(() {
                    //     _content = (event.data == null ? " " : event.data!);
                    //   });
                    // });
                  }),
            ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 12,
              )
            ]),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(result)],
            ),
            Row(children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 10,
              )
            ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _childrenList(),
            ),
            const SizedBox(
              height: 35,
            ),
          ])
        ])));
  }

//下一頁(綜合)
  void toTheNextPage(BuildContext context, Widget Page) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('password', "2147896325");
    // Navigator.push(context, MaterialPageRoute(builder: (context) => main2(data:"傳遞測試")));
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("換頁囉")));
    showMySnackBar(context);
    var resultValue = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Page),
    );

    print('返回 $resultValue');
    setState(() {
      result = resultValue.toString();
    });
  }

//載入
  void replace(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('password', "2147896325");
    passWord = prefs.getString('password')!;
    print('返回 $passWord');
  }

// Add
  void mainaddContainer(int type) {
    containerList.add(createNewbtn(type));
  }

// Pop
  void mainpopContainer() {
    containerList.removeLast();
  }

// _childrenList
  List<Widget> _childrenList() {
    return containerList;
  }

  void showMySnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('換頁囉'),
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: '這個是連結 但是我沒放',
        onPressed: () {
          print('復原...');
        },
      ),
    ));
  }

  static MaterialLocalizations? of(BuildContext context) {
    return Localizations.of<MaterialLocalizations>(
        context, MaterialLocalizations);
  }
}
