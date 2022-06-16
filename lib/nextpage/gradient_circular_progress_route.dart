import 'dart:math';
import 'package:flutter/material.dart';
import 'package:untitled/default_ui/next_page_preset_class.dart';
import 'package:untitled/element/gradient_circular_progress_indicator.dart';
import 'package:untitled/element/turn_box.dart';

import 'package:untitled/resource/strings.dart';

class GradientCircularProgressRoute extends StatefulWidget {
  const GradientCircularProgressRoute({Key? key}) : super(key: key);

  @override
  GradientCircularProgressRouteState createState() {
    return GradientCircularProgressRouteState();
  }
}

class GradientCircularProgressRouteState
    extends State<GradientCircularProgressRoute> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 100),
    );
    bool isForward = true;
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        isForward = true;
      } else if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        if (isForward) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      } else if (status == AnimationStatus.reverse) {
        isForward = false;
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NextPagePresetClass(
      title: strings.GradientCircularPage,
      body:SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AnimatedBuilder(
                animation: _animationController,
                builder: (BuildContext context, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      children: <Widget>[
                        Wrap(
                          spacing: 10.0,
                          runSpacing: 16.0,
                          children: <Widget>[
                            GradientCircularProgressIndicator(
                              // No gradient
                              colors: const [Colors.blue, Colors.blue],
                              radius: 50.0,
                              value: _animationController.value,
                              stops: const [20, 20],
                              strokeWidth: 3.0,
                            ),
                            GradientCircularProgressIndicator(
                              colors: const [Colors.red, Colors.orange],
                              radius: 50.0,
                              stops: const [20, 20],
                              strokeWidth: 3.0,
                              value: _animationController.value,
                            ),
                            GradientCircularProgressIndicator(
                              colors: const [
                                Colors.red,
                                Colors.orange,
                                Colors.red
                              ],
                              radius: 50.0,
                              stops: const [20, 20, 20],
                              strokeWidth: 3.0,
                              value: _animationController.value,
                            ),
                            GradientCircularProgressIndicator(
                              colors: const [Colors.teal, Colors.cyan],
                              radius: 50.0,
                              stops: const [20, 20],
                              strokeWidth: 3.0,
                              strokeCapRound: true,
                              value: CurvedAnimation(
                                parent: _animationController,
                                curve: Curves.decelerate,
                              ).value,
                            ),
                            TurnBox(
                              turns: 1 / 8,
                              child: GradientCircularProgressIndicator(
                                colors: const [
                                  Colors.red,
                                  Colors.orange,
                                  Colors.red
                                ],
                                radius: 50.0,
                                stops: const [20, 20, 20],
                                strokeWidth: 3.0,
                                strokeCapRound: true,
                                backgroundColor: Colors.red.shade50,
                                totalAngle: 1.5 * pi,
                                value: CurvedAnimation(
                                  parent: _animationController,
                                  curve: Curves.ease,
                                ).value,
                              ),
                            ),
                            RotatedBox(
                              quarterTurns: 1,
                              child: GradientCircularProgressIndicator(
                                colors: [
                                  Colors.blue.shade700,
                                  Colors.blue.shade200
                                ],
                                radius: 50.0,
                                stops: const [20, 20],
                                strokeWidth: 3.0,
                                strokeCapRound: true,
                                backgroundColor: Colors.transparent,
                                value: _animationController.value,
                              ),
                            ),
                            GradientCircularProgressIndicator(
                              colors: [
                                Colors.red,
                                Colors.amber,
                                Colors.cyan,
                                Colors.green.shade200,
                                Colors.blue,
                                Colors.red
                              ],
                              radius: 50.0,
                              stops: const [10, 20, 30, 40, 50, 60],
                              strokeWidth: 3.0,
                              strokeCapRound: true,
                              value: _animationController.value,
                            ),
                          ],
                        ),
                        GradientCircularProgressIndicator(
                          colors: [
                            Colors.blue.shade700,
                            Colors.blue.shade200
                          ],
                          radius: 100.0,
                          stops: const [20, 20],
                          strokeWidth: 3.0,
                          value: _animationController.value,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: GradientCircularProgressIndicator(
                            colors: [
                              Colors.blue.shade700,
                              Colors.blue.shade300
                            ],
                            radius: 100.0,
                            stops: const [20, 20],
                            strokeWidth: 3.0,
                            value: _animationController.value,
                            strokeCapRound: true,
                          ),
                        ),
                        //剪裁半圆
                        ClipRect(
                          child: Align(
                            alignment: Alignment.topCenter,
                            heightFactor: .5,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: SizedBox(
                                //width: 100.0,
                                child: TurnBox(
                                  turns: .75,
                                  child: GradientCircularProgressIndicator(
                                    colors: [
                                      Colors.teal,
                                      Colors.cyan.shade500
                                    ],
                                    radius: 100.0,
                                    stops: const [20, 20],
                                    strokeWidth: 3.0,
                                    value: _animationController.value,
                                    totalAngle: pi,
                                    strokeCapRound: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 104.0,
                          width: 200.0,
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Positioned(
                                height: 200.0,
                                top: .0,
                                child: TurnBox(
                                  turns: .75,
                                  child: GradientCircularProgressIndicator(
                                    colors: [
                                      Colors.black,
                                      Colors.cyan.shade500
                                    ],
                                    radius: 100.0,
                                    stops: const [0.2, 0.5],
                                    strokeWidth: 3.0,
                                    value: _animationController.value,
                                    totalAngle: pi,
                                    strokeCapRound: true,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  "${(_animationController.value * 100).toInt()}%",
                                  style: const TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      )
    );
  }
}
