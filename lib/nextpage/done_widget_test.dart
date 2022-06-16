import 'package:flutter/material.dart';
import 'package:untitled/default_ui/next_page_preset_class.dart';
import 'package:untitled/element/custom_checkbox.dart';
import 'package:untitled/element/done_widget.dart';
import 'package:untitled/element/render_done_object.dart';

import 'package:untitled/resource/strings.dart';

class DoneWidgetTest extends StatefulWidget {
  const DoneWidgetTest({Key? key}) : super(key: key);

  @override
  State<DoneWidgetTest> createState() => _DoneWidgetTest();
}

class _DoneWidgetTest extends State<DoneWidgetTest> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return NextPagePresetClass(
        title: strings.DoneWidgetTestPage,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              DoneWidget(),
              Padding(
                padding: EdgeInsets.all(18.0),
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: DoneWidget(
                    outline: true,
                    outVV: false,
                  ),
                ),
              ),
              SizedBox(
                width: 30,
                height: 30,
                child: DoneWidget(
                  outVV: false,
                ),
              ),
            ],
          ),
        ));
  }

  void _onChange(value) {
    setState(() => _checked = value);
  }
}
