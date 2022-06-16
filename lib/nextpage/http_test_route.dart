import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled/default_ui/next_page_preset_class.dart';
import 'package:untitled/resource/strings.dart';

class HttpTestRoute extends StatefulWidget {
  const HttpTestRoute({Key? key}) : super(key: key);

  @override
  _HttpTestRouteState createState() => _HttpTestRouteState();
}

class _HttpTestRouteState extends State<HttpTestRoute> {
  bool _loading = false;
  String _text = "";

  @override
  Widget build(BuildContext context) {
    return NextPagePresetClass(
      title: strings.HttpTestRoutePage,
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: const Text("獲取百度首頁"),
              onPressed: _loading ? null : request,
            ),
            const SizedBox(
              width: double.infinity,
            ),
            Text(
              _text.replaceAll(RegExp(r"\s"), ""),
            )
          ],
        ),
      ),
    );
  }

  request() async {
    setState(() {
      _loading = true;
      _text = "正在獲取...";
    });
    try {
      //创建一个HttpClient
      HttpClient httpClient = HttpClient();
      //打开Http连接
      HttpClientRequest request =
          await httpClient.getUrl(Uri.parse("https://www.baidu.com"));
      //使用iPhone的UA
      request.headers.add(
        "user-agent",
        "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1",
      );
      //等待连接服务器（会将请求信息发送给服务器）
      HttpClientResponse response = await request.close();
      //读取响应内容
      _text = await response.transform(utf8.decoder).join();
      //输出响应头
      print(response.headers);

      //关闭client后，通过该client发起的所有请求都会中止。
      httpClient.close();
    } catch (e) {
      _text = "獲取失敗：$e";
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }
}
