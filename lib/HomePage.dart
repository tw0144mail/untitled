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

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
    required this.contextHP,
    this.hitCount,
  }) : super(key: key);

  final BuildContext contextHP;
  final int? hitCount;

  @override
  _OnePage createState() => _OnePage();
}

class _OnePage extends State<HomePage> {
  var result = "0";
  String passWord = "0";
  late List<Container> containerList;
  String _content = " ";
  String thisAddress = '/HomePage/' + '0' + '/';

  List<HomeComponents> HomeComponentsList = [
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.NextPage]),
        address:
            'Main2/' +
            '產品名稱xxx' +
            '/' +
            '產品內容xxx' +
            '/' +
            '0' +
            '/' +
            '66'),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.CustomPaintRoutePage]),
        address: "CustomPaintRoute"),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.WithChunksPage]),
        address: "WithChunks"),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.SocketRoutePage]),
        address: "SocketRoute"),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.GuidePage]),
        address: "MainBottomNavigationBar"),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.TabPage]), address: "Tabbar"),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.DrawerPage]),
        address: "Drawer"),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.StackComponentsPage]),
        address: "Stack"),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.ListPage]),
        address: "ListView"),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.GridElementPage]),
        address: "GridView"),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.TableElementPage]),
        address: "Table"),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.DynamicGenerationPage]),
        address: "DynamicGeneration"),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.MixedPage]),
        address: "GradientButtonRoute"),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.TurnBoxPage]),
        address: "TurnBoxRoute"),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.GradientCircularPage]),
        address: "GradientCircularProgressRoute"),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.CustomCheckboxPage]),
        address: "CustomCheckboxTest"),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.DoneWidgetTestPage]),
        address: "DoneWidgetTest"),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.WaterMarkPage]),
        address: "WaterMark"),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.WaterMarkTestPage]),
        address: "WaterMarkTest"),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.FileOperationRoutePage]),
        address: "FileOperationRoute"),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.HttpTestRoutePage]),
        address: "HttpTestRoute"),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.FutureBuilderRouteStatePage]),
        address: "FutureBuilderRouteState"),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.WebSocketsPage]),
        address: "WebSocketRoute"),
    HomeComponents(
        title: sprintf(S.current.GoTo, [S.current.MapPage]),
        address: "Map"),
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

              // if (HomeComponentsList[type].getTitle()! ==
              //     sprintf(strings.GoTo, [strings.NextPage])) {
              //   // final Product product = Product(
              //   //     name: "產品名稱xxx", desc: "產品內容xxx", price: 0, stock: 66);
              //   // toTheNextPage(context, main2(name: "產品名稱xxx", desc: "產品內容xxx", price: 0, stock: 66));
              //   // String GoTO = result != "沒按過" ? result.toString() : "0";
              //   context.push(thisAddress +
              //       '/' +
              //       'Main2/' +
              //       '產品名稱xxx' +
              //       '/' +
              //       '產品內容xxx' +
              //       '/' +
              //       '0' +
              //       '/' +
              //       '66');
              // } else {
                // toTheNextPage(context, HomeComponentsList[type].nextPage!);
                context.push(thisAddress + HomeComponentsList[type].address!);
              // }
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
    // print('result $result');
    // if (result != null &&
    //     result != "null" &&
    //     result != "0" &&
    //     result != "沒按過") {
    //   result = sprintf(strings.NPressed, [result]);
    // } else {
    //   result = "沒按過";
    // }

    print('hitCount $widget.hitCount ');
    if (widget.hitCount != null &&
        widget.hitCount != "null" &&
        widget.hitCount != "0" &&
        widget.hitCount != 0 &&
        widget.hitCount != "沒按過") {
      result = sprintf(strings.NPressed, [widget.hitCount]);
    } else {
      result = "沒按過";
    }
    String GoTO = result != "沒按過" ? result.toString() : "0";
    thisAddress = '/HomePage/' + GoTO + '/';

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
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setString('password', "2147896325");
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
