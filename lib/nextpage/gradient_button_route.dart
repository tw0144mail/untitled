import 'package:flutter/material.dart';
import 'package:untitled/default_ui/next_page_preset_class.dart';
import 'package:untitled/element/gradient_button.dart';
import 'package:untitled/resource/strings.dart';

class GradientButtonRoute extends StatefulWidget {
  @override
  _GradientButtonRouteState createState() => _GradientButtonRouteState();
}

class _GradientButtonRouteState extends State<GradientButtonRoute> {
  @override
  Widget build(BuildContext context) {
    return NextPagePresetClass(
      title: strings.MixedPage,
      body: Container(
        child: Column(
          children: <Widget>[
            GradientButton(
              colors: const [Colors.orange, Colors.red],
              height: 50.0,
              child: Text("Submit"),
              onPressed: onTap,
              width: 50.0,
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
      ),
    );
  }

  onTap() {
    print("button click");
  }
}
