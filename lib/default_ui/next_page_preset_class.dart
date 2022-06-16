import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/Integrate.dart';

class NextPagePresetClass extends StatefulWidget {
  const NextPagePresetClass({
    this.title = "你是不是忘了給標題了",
    this.drawer,
    this.body,
    this.floatingActionButton,
    this.bottom,
  });

  final String title;
  final Widget? drawer;
  final Widget? body;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? bottom;

  @override
  _NextPagePresetClass createState() => _NextPagePresetClass();
}

class _NextPagePresetClass extends State<NextPagePresetClass>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.title == "無標題"
          ? null
          : AppBar(
              title: Text(widget.title),
              centerTitle: true,
              bottom: widget.bottom,
            ),
      drawer: widget.drawer,
      body: widget.body,
      floatingActionButton: widget.floatingActionButton,
    );
  }
}
