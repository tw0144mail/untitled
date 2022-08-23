import 'dart:math';
import 'package:flutter/material.dart';


class HomeComponents  {
  const HomeComponents({
    this.title ,
    this.nextPage ,
    this.address ,
  });
  final String? title;
  final Widget? nextPage;
  final String? address;

  String? getTitle(){
    return title;
  }

  Widget? getNextPage(){
    return nextPage;
  }

  String? getAddress(){
    return address;
  }
}

