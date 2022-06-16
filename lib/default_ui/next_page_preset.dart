import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NextPagePreset extends ComponentElement {
  NextPagePreset(
    Widget NextPagePresetwidget,
  {required this.NextPageStrokeWidth,
    required this.NextPageRadius,}
  ) : super(NextPagePresetwidget);

  Widget NextPageStrokeWidth ;
  String NextPageRadius = '1';
  @override

  Widget build() {
    log("看看有沒有到 NextPagePreset");
    return Scaffold(
      appBar: AppBar(
        title: Text(NextPageRadius),
        centerTitle: true,
      ),
      body: NextPageStrokeWidth,
    );
  }
}
