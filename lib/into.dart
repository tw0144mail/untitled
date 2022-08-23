import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class Into extends StatefulWidget {
  Into({
    Key? key,
  }) : super(key: key);

  @override
  _Into createState() => _Into();
}

class _Into extends State<Into> {


  @override
  void initState() {
    super.initState();
    const period = const Duration(seconds: 5);
    Timer.periodic(period, (timer) {
      //到时回调
      log("到时回调");
      context.push('/HomePage' + '/' + '0');
      //取消定时器，避免无限回调
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    log("Into  build");
    // const timeout = const Duration(seconds: 5);
    // Timer(timeout, () {
    //   //到时回调
    //   log("到时回调");
    //   context.push('/HomePage' + '/' + '2');
    // });


    return Text("好啦 煩誒");
  }

  @override
  void didChangeDependencies() {
    // context.push('/HomePage' + '/' + '1');
    // ignore: must_call_super
  }
}
