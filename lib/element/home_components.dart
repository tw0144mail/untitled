import 'dart:math';
import 'package:flutter/material.dart';


class HomeComponents  {
  const HomeComponents({
    this.title ,
    this.nextPage ,
  });
  final String? title;
  final Widget? nextPage;


  String? getTitle(){
    return title;
  }

  Widget? getNextPage(){
    return nextPage;
  }
}

