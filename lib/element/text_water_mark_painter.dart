// import 'package:flutter/widgets.dart';
// import 'package:untitled/element/water_mark.dart';
//
// import 'dart:ui' as ui;
//
// /// 文本水印画笔
// class TextWaterMarkPainter extends WaterMarkPainter {
//   TextWaterMarkPainter({
//     Key? key,
//     double? rotate,
//     EdgeInsets? padding,
//     TextStyle? textStyle,
//     required this.text,
//   })
//       : assert(rotate == null || rotate >= -90 && rotate <= 90),
//         rotate = rotate ?? 0,
//         padding = padding ?? const EdgeInsets.all(10.0),
//         textStyle = textStyle ??
//             TextStyle(
//               color: Color.fromARGB(20, 0, 0, 0),
//               fontSize: 14,
//             );
//
//   double rotate; // 文本旋转的度数，是角度不是弧度
//   TextStyle textStyle; // 文本样式
//   EdgeInsets padding; // 文本的 padding
//   String text; // 文本
//
//   @override
//   Size paintUnit(Canvas canvas, double devicePixelRatio) {
//     // 1. 先绘制文本
//     // 2. 应用旋转和padding
//     //根据屏幕 devicePixelRatio 对文本样式中长度相关的一些值乘以devicePixelRatio
//     final _textStyle = _handleTextStyle(devicePixelRatio);
//     final _padding = padding * devicePixelRatio;
//
//     //构建文本段落
//     final builder = ui.ParagraphBuilder(_textStyle.getParagraphStyle(
//       textAlign: TextAlign.start,
//       textScaleFactor: devicePixelRatio,
//     ));
//
//     //添加要绘制的文本及样式
//     builder
//       ..pushStyle(_textStyle.getTextStyle()) // textStyle 为 ui.TextStyle
//       ..addText(text);
//
//     //layout 后我们才能知道文本占用的空间
//     ui.Paragraph paragraph = builder.build()
//       ..layout(ui.ParagraphConstraints(width: double.infinity));
//     // 省略
//     //文本占用的真实宽度
//     final textWidth = paragraph.width;
//     //文本占用的真实高度
//     final textHeight = paragraph.height;
//
//     // 将弧度转化为度数
//     final radians = math.pi * rotate / 180;
//
//     //通过三角函数计算旋转后的位置和size
//     final orgSin = math.sin(radians);
//     final sin = orgSin.abs();
//     final cos = math.cos(radians).abs();
//
//     final width = textWidth * cos;
//     final height = textWidth * sin;
//     final adjustWidth = fontSize * sin;
//     final adjustHeight = fontSize * cos;
//
//     // 为什么要平移？下面解释
//     if (orgSin >= 0) { // 旋转角度为正
//     canvas.translate(
//     adjustWidth + padding.left,
//     padding.top,
//     );
//     } else { // 旋转角度为负
//     canvas.translate(
//     padding.left,
//     height + padding.top,
//     );
//     }
//     canvas.rotate(radians);
//     // 绘制文本
//     painter.paint(canvas, Offset.zero);
//     // 返回水印单元所占的真实空间大小（需要加上padding）
//     return Size(
//     width + adjustWidth + padding.horizontal,
//     height + adjustHeight + padding.vertical,
//     );
//
//
//     }
//
//   TextStyle _handleTextStyle(double devicePixelRatio) {
//     var style = textStyle;
//     double _scale(attr) => attr == null ? 1.0 : devicePixelRatio;
//     return style.apply(
//       decorationThicknessFactor: _scale(style.decorationThickness),
//       letterSpacingFactor: _scale(style.letterSpacing),
//       wordSpacingFactor: _scale(style.wordSpacing),
//       heightFactor: _scale(style.height),
//     );
//   }
//
//   @override
//   bool shouldRepaint(TextWaterMarkPainter oldPainter) {
//     return oldPainter.rotate != rotate ||
//         oldPainter.text != text ||
//         oldPainter.padding != padding ||
//         oldPainter.textDirection != textDirection ||
//         oldPainter.textStyle != textStyle;
//   }
//
// // Widget wTextPainterTest() {
// //   // 我们想提前知道 Text 组件的大小
// //   Text text = Text('flutter@wendux', style: TextStyle(fontSize: 18));
// //   // 使用 TextPainter 来测量
// //   TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
// //   // 将 Text 组件文本和样式透传给TextPainter
// //   painter.text = TextSpan(text: text.data, style: text.style);
// //   // 开始布局测量，调用 layout 后就能获取文本大小了
// //   painter.layout();
// //   // 自定义组件 AfterLayout 可以在布局结束后获取子组件的大小，我们用它来验证一下
// //   // TextPainter 测量的宽高是否正确
// //   return AfterLayout(
// //     callback: (RenderAfterLayout value) {
// //       // 输出日志
// //       print('text size(painter): ${painter.size}');
// //       print('text size(after layout): ${value.size}');
// //     },
// //     child: text,
// //   );
// // }
// }
