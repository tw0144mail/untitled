import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/common_import.dart';

import 'package:untitled/resource/strings.dart';

/// A widget that paints watermark.
class WaterMarkTest extends StatefulWidget {
  const WaterMarkTest({
    Key? key,
    this.repeat = ImageRepeat.repeat,
  }) : super(key: key);

  /// 单元水印的重复方式
  final ImageRepeat repeat;

  @override
  State<WaterMarkTest> createState() => _WaterMarkTest();
}

class _WaterMarkTest extends State<WaterMarkTest> {

  @override
  Widget build(BuildContext context) {
    return NextPagePresetClass(
      title: strings.WaterMarkTestPage,
      body:FutureBuilder(
        // future: WaterMark._getWaterMarkImage(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Container();
          } else {
            return DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: snapshot.data,
                  repeat: widget.repeat,
                  alignment: Alignment.topLeft,
                  //很重要
                  scale: MediaQuery.of(context).devicePixelRatio,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
