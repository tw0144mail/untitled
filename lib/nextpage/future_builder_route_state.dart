import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:untitled/default_ui/next_page_preset_class.dart';
import 'package:untitled/resource/strings.dart';

class FutureBuilderRouteState extends StatefulWidget {
  const FutureBuilderRouteState({Key? key}) : super(key: key);

  @override
  _FutureBuilderRouteState createState() => _FutureBuilderRouteState();
}

class _FutureBuilderRouteState extends State<FutureBuilderRouteState> {
  final Dio _dio = Dio();

  @override
  Widget build(BuildContext context) {
    return NextPagePresetClass(
      title: strings.FutureBuilderRouteStatePage,
      body:Container(
        alignment: Alignment.center,
        child: FutureBuilder(
            future: _dio.get("https://api.github.com/orgs/flutterchina/repos"),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              //请求完成
              if (snapshot.connectionState == ConnectionState.done) {
                Response response = snapshot.data;
                //发生错误
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                //请求成功，通过项目信息构建用于显示项目名称的ListView
                return ListView(
                  children: response.data
                      .map<Widget>((e) => ListTile(title: Text(e["full_name"])))
                      .toList(),
                );
              }
              //请求未完成时弹出loading
              return const CircularProgressIndicator();
            }),
      ),
    );

  }
}
