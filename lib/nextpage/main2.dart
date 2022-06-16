import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';

// 页面使用
import 'package:flutter/cupertino.dart';
import 'package:untitled/default_ui/next_page_preset_adapter.dart';
import 'package:untitled/default_ui/next_page_preset_class.dart';
import 'package:untitled/element/event_bus_utils.dart';
import 'package:untitled/nextpage/product.dart';

import '../common/global.dart';

class main2 extends StatefulWidget {
  // int intVal = 0;
  // String strVal = "";
  // //宣告資料變數
  // int intVal;
  // String strVal;
  // This widget is the root of your application.
  // final String data;
  // main2({Key? key, required this.data}) : super(key: key);

  final Product product;

  main2({Key? key, required this.product}) : super(key: key);

  // const main2();
  static final RouteObserver<PageRoute> routeObserver =
  RouteObserver<PageRoute>();

  @override
  _TwoPage createState() => _TwoPage();
}

class _TwoPage extends State<main2> with RouteAware {
  int _main2frequency = 0;
  String password = "";
  String picture_location = "assets/images/zeor_test.jpg";
  double picture_height = 200.0;
  String Button_text = "切換圖片-甘雨";
  String _content = "";

  late Product product = widget.product;

  @override
  void initState() {
    // print('Main2 ${product.price}');
    _content = "浩";
    EventBusUtils.getInstance()
        .on<StringContentEvent>()
        .listen((event) {
      _content = event.str;
      log("event.str" + event.str);
      setState(() {
        _content = event.str;
      });
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    main2.routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void didPopNext() {
    // Covering route was popped off the navigator.
    Navigator.pop(context, "B頁資料");
    print('返回NewView');
    Logger.v("返回NewView");
  }

  @override
  void didPush() {
    // Route was pushed onto navigator and is now topmost route.
    print('进入NewView');
  }

  @override
  void dispose() {
    main2.routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Future<bool> _requestPop() {
    print('返回NewView');
    Navigator.pop(context, widget.product.price.toString());
    return Future(() => false);
  }

  @override
  Widget build(BuildContext context) {
    log(widget.product.price.toString());
    EventBusUtils.getInstance()
        .on<StringContentEvent>()
        .listen((event) {
      _content = event.str;
      log("event.str" + event.str);
      setState(() {
        _content = event.str;
      });
    });
    return NextPagePresetClass(
        title: '這邊是第二頁',
        body: WillPopScope(
          onWillPop: _requestPop,
          child: Center(
            child: ListView(
              children: <Widget>[
                Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: MediaQuery
                                  .of(context)
                                  .padding
                                  .top,
                            )
                          ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                  child: const Text('按一下+一下'),
                                  onPressed: () {
                                    btnClickEvent();
                                  }),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text(widget.product.price.toString())],
                          ),
                          Row(children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: MediaQuery
                                  .of(context)
                                  .padding
                                  .top,
                            )
                          ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                  child: Text(Button_text),
                                  onPressed: () {
                                    btnPicConvert();
                                    // EventBusUtils.getInstance()
                                    //     .fire(MyEventBusString(code: 3345678, data: "main222跨頁測試中～"));
                                  }),
                            ],
                          ),
                          Row(children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: MediaQuery
                                  .of(context)
                                  .padding
                                  .top,
                            )
                          ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Image.asset(
                                    picture_location,
                                    fit: BoxFit.fitHeight,
                                    height: picture_height,
                                  ),
                                ),
                              ]),
                          Row(children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: MediaQuery
                                  .of(context)
                                  .padding
                                  .top,
                            )
                          ]),
                          Row(children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: MediaQuery
                                  .of(context)
                                  .padding
                                  .top,
                            )
                          ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                  child: const Text('訂閱'),
                                  onPressed: () {
                                    EventBusUtils.getInstance()
                                        .on<MyEventBusString>()
                                        .listen((event) {
                                      _content = (event.data==null? " " : event.data!) ;
                                      log("event.str" + event.data.toString());
                                      setState(() {
                                        _content = (event.data==null? " " : event.data!) ;
                                      });
                                    });
                                    log("_content" + _content);
                                    // EventBusUtils.getInstance().fire(
                                    //     StringContentEvent("main2跨頁測試中～"));
                                    // EventBusUtils.getInstance()
                                    //     .on<StringContentEvent>()
                                    //     .listen((event) {
                                    //   print(event.str);
                                    //   setState(() {
                                    //     _content = event.str;
                                    //   });
                                    // });
                                  }),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                  child: const Text('發送'),
                                  onPressed: () {
                                    EventBusUtils.getInstance().fire(
                                        MyEventBusString(code: 3345678,
                                            data: "main4567898765456跨頁測試中～"));
                                    log("_content" + _content);
                                    // EventBusUtils.getInstance().fire(
                                    //     StringContentEvent("main2跨頁測試中～"));
                                    // EventBusUtils.getInstance()
                                    //     .on<StringContentEvent>()
                                    //     .listen((event) {
                                    //   print(event.str);
                                    //   setState(() {
                                    //     _content = event.str;
                                    //   });
                                    // });
                                  }),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("訂閱測試" + _content)],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                  child: const Text('確定公共參數'),
                                  onPressed: () {
                                    setState(() {
                                      Global.textContent = Global.textContent;
                                    });
                                  }),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("textContent" + Global.textContent)],
                          ),
                        ])),
              ],
            ),
          ),
        ));
  }

  void btnClickEvent() {
    setState(() {
      widget.product.price++;
    });
    // _main2frequency++;
    print("" + widget.product.price.toString() + "拉");
  }

  void btnPicConvert() {
    switch (Button_text) {
      case "切換圖片-甘雨":
        setState(() {
          picture_location = "assets/images/ganyu_test.png";
          picture_height = 600.0;
          Button_text = "切換圖片-傑洛";
        });
        break;
      case "切換圖片-傑洛":
        setState(() {
          picture_location = "assets/images/zeor_test.jpg";
          picture_height = 200.0;
          Button_text = "切換圖片-甘雨";
        });
        break;
      default:
        print("你怎麼到這裡了? 坐下來說說你的故事吧");
        break;
    }
    print("" + picture_location + "拉");
  }

//监听左上角返回和实体返回
// return WillPopScope(
//     onWillPop: _requestPop,
//   // onWillPop: () async {
//   //   // print('返回NewView');
//   //   // // return new Future.value(false);
//   //   // Navigator.pop(context, false);
//   //   // return new Future(() => false);
//   //
//   // },
//   child: new Scaffold(
//       body: new Center(
//           child: ElevatedButton(
//     child: Text('返回首頁'),
//     onPressed: () {
//       Navigator.pop(context, 'B頁資料');
//     },
//   ))),
// );
//   return WillPopScope(
//     onWillPop: () async {
//       Navigator.pop(context, '返回');---------
//       return true;
//     },
//     child: Container(
//         alignment: Alignment.center
//     ),
//   );
// }

}
