import 'dart:developer';

import 'package:flutter/cupertino.dart';

import 'next_page_preset.dart';

class CustomHome extends Widget {
  CustomHome({
    Key? key,
    required this.HomestrokeWidth,
    required this.Homeradius,
  }) : super(key: key);

  Widget HomestrokeWidth;
  String Homeradius;

  @override
  Element createElement() {
    log("看看有沒有到 CustomHome");
    return NextPagePreset(this,
        NextPageRadius: Homeradius, NextPageStrokeWidth: HomestrokeWidth);
  }
}
