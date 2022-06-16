import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:untitled/common_import.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/element/download_http.dart';


class WithChunks extends StatefulWidget {
  const WithChunks({Key? key}) : super(key: key);

  @override
  _WithChunks createState() => _WithChunks();
}

class _WithChunks extends State<WithChunks> {
  String _text = "";
  String savePath = "";
  String showString = "";
  String currentAddress = "";
  bool isDisable = false;
  GlobalKey _keycommonStorage = GlobalKey();

  @override
  Widget build(BuildContext context) {
    if (currentAddress == "") {
      limitedStorage();
    }
    return NextPagePresetClass(
      title: strings.WithChunksPage,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              width: double.infinity,
              height: 30,
            ),
            Text(currentAddress),
            ElevatedButton(
              child: const Text("下載"),
              onPressed: isDisable ? null : request,
            ),
            ElevatedButton(
              child: const Text("下載到限定地址"),
              onPressed: isDisable ? null : limitedStorage,
            ),
            ElevatedButton(
              child: const Text("下載到共通地址"),
              onPressed: isDisable ? null : commonStorage,
              key: _keycommonStorage,
            ),
            const SizedBox(
              width: double.infinity,
              height: 30,
            ),
            Text(
              _text.replaceAll(RegExp(r"\s"), ""),
            ),
            // const SizedBox(
            //   width: double.infinity,
            //   height: 150,
            // ),
            // Form(
            //   child: TextFormField(
            //     decoration: const InputDecoration(labelText: 'Send a message'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // /***
  //  * 获取外部存储目录
  //  */
  // _getSDCardDirectory() async {
  //   Directory root = await getTemporaryDirectory();
  //   savePath = root.path + "/example/HBuilder.9.0.2.macosx_64.dmg";
  //   // setState(() {
  //   //   currentAddress = "限定";
  //   // });
  // }

  request() async {
    var url = "http://download.dcloud.net.cn/HBuilder.9.0.2.macosx_64.dmg";
    log("下載路徑" + savePath);
    isDisable = true;
    await downloadWithChunks(url, savePath,
        onReceiveProgress: (received, total) {
      if (total != -1 && showString != "${(received / total * 100).floor()}%") {
        showString = "${(received / total * 100).floor()}%";
        print(showString);
        if (showString == "100%") {
          showString = "";
          mySetState("", "下載完成");
          isDisable = false;
        } else {
          mySetState("", showString);
        }
      }
    });
  }

  limitedStorage() async {
    log("limitedStorage");
    Directory root = await getTemporaryDirectory();
    savePath = root.path + "/example/HBuilder.9.0.2.macosx_64.dmg";
    // setState(() {
    //   currentAddress = "限定";
    // });
    mySetState("限定", "");
  }

  commonStorage() async {
    log("commonStorage");
    Directory? root = await getExternalStorageDirectory();
    savePath = root!.path + "/example/HBuilder.9.0.2.macosx_64.dmg";
    // setState(() {
    //   currentAddress = "共通";
    // });
    final RenderBox renderBoxRed = _keycommonStorage.currentContext!.findRenderObject() as RenderBox;
    final sizeRed = renderBoxRed.size;
    //输出背景为红色的widget的宽高
    print("size of red:$sizeRed");
    mySetState("共通", "");
  }

  mySetState(String mycurrentAddress, String my_text) {
    setState(() {
      if (mycurrentAddress != "") {
        currentAddress = mycurrentAddress;
      }
      if (my_text != "") {
        _text = my_text;
      }
    });
  }
}
