// import 'package:flutter/cupertino.dart';
//
// class ChessWidget extends LeafRenderObjectWidget {
//   @override
//   RenderObject createRenderObject(BuildContext context) {
//     // 返回Render对象
//     return RenderChess();
//   }
// //...省略updateRenderObject函数实现
// }
//
// class RenderChess extends RenderBox {
//   @override
//   void performLayout() {
//     //确定ChessWidget的大小
//     size = constraints.constrain(
//       constraints.isTight ? Size.infinite : Size(150, 150),
//     );
//   }
//
//   @override
//   void paint(PaintingContext context, Offset offset) {
//     Rect rect = offset & size;
//     drawChessboard(canvas, rect); // 绘制棋盘
//     drawPieces(context.canvas, rect);//绘制棋子
//   }
// }