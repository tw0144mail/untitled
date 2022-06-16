import 'package:flutter/material.dart';
import 'package:untitled/element/render_done_object.dart';

class DoneWidget extends LeafRenderObjectWidget {
  const DoneWidget({
    Key? key,
    this.strokeWidth = 2.0,
    this.color = Colors.green,
    this.outline = false,
    this.outVV = true,
  }) : super(key: key);

  //线条宽度
  final double strokeWidth;

  //轮廓颜色或填充色
  final Color color;

  //如果为true，则没有填充色，color代表轮廓的颜色；如果为false，则color为填充色
  final bool outline;

  //如果为true，则有勾勾；如果为false，则沒有勾勾
  final bool outVV;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderDoneObject(
      strokeWidth,
      color,
      outline,
      outVV,
    )..animationStatus = AnimationStatus.forward; // 创建时执行正向动画
  }

  @override
  void updateRenderObject(context, RenderDoneObject renderObject) {
    renderObject
      ..strokeWidth = strokeWidth
      ..outline = outline
      ..color = color;
  }
}
