//
//
// import 'dart:async';
// import 'package:camera/camera.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// import '../util/dialog_util.dart';
//
//
//
// typedef TakePictureCallBack=void Function(String fileName,String filePath);
// ///仅仅是拍照的控件
// class MyCameraWidget extends StatefulWidget {
//   List<CameraDescription> cameras;
//   TakePictureCallBack takePictureCallBack;
//   MyCameraWidget(this.cameras,this.takePictureCallBack);
//   @override
//   MyCameraWidgetState createState() {
//     return MyCameraWidgetState();
//   }
// }
//
// /// Returns a suitable camera icon for [direction].
// IconData getCameraLensIcon(CameraLensDirection direction) {
//   switch (direction) {
//     case CameraLensDirection.back:
//       return Icons.camera_rear;
//     case CameraLensDirection.front:
//       return Icons.camera_front;
//     case CameraLensDirection.external:
//       return Icons.camera;
//     default:
//       throw ArgumentError('Unknown lens direction');
//   }
// }
//
// void logError(String code, String message) {
//   if (message != null) {
//     print('Error: $code\nError Message: $message');
//   } else {
//     print('Error: $code');
//   }
// }
//
// class MyCameraWidgetState extends State<MyCameraWidget>
//     with WidgetsBindingObserver, TickerProviderStateMixin {
//
//   late CameraController controller;
//   late XFile imageFile;
//   bool enableAudio = true;
//
//   // Counting pointers (number of user fingers on screen)
//   ///以下是关于手指缩放画面的变量
//   int _pointers = 0;
//   double _minAvailableZoom = 1.0;
//   double _maxAvailableZoom = 1.0;
//   double _currentScale = 1.0;
//   double _baseScale = 1.0;
//   //曝光度
//   double _minAvailableExposureOffset = 0.0;
//   double _maxAvailableExposureOffset = 0.0;
//   double _currentExposureOffset = 0.0;
//
//   late Future<void> _initializeControllerFuture;
//
//   Size? mediaSize=null;
//   late double scale;
//   @override
//   void initState(){
//     super.initState();
//     if(widget.cameras==null||widget.cameras.length==0){
//       DialogUtil.showConfirmDialog(context, {
//         "title": "未获取到可用的相机，请退出重试。",
//         "confirm": () {
//           // 确定按钮事件
//         },
//         "cancel":(){
//           // 取消按钮事件
//         }
//       });
//
//     }
//     // To display the current output from the Camera,
//     // create a CameraController.
//     controller = CameraController(
//       // Get a specific camera from the list of available cameras.
//       widget.cameras.first,
//       // Define the resolution to use.
//       ResolutionPreset.veryHigh,
//     );
//
//     // Next, initialize the controller. This returns a Future.
//     _initializeControllerFuture = controller.initialize();
//
//
//     _ambiguate(WidgetsBinding.instance).addObserver(this);
//
//   }
//
//   @override
//   void dispose() {
//     _ambiguate(WidgetsBinding.instance).removeObserver(this);
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     final CameraController cameraController = controller;
//
//     // App state changed before we got the chance to initialize.
//     if (cameraController == null || !cameraController.value.isInitialized) {
//       return;
//     }
//
//     if (state == AppLifecycleState.inactive) {
//       cameraController.dispose();
//     } else if (state == AppLifecycleState.resumed) {
//       onNewCameraSelected(cameraController.description);
//     }
//   }
//
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       body: Container(
//         child: Column(
//           children: [
//             Expanded(child: FutureBuilder<void>(
//               future:_initializeControllerFuture,
//               builder:(context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   ///初始化完成以后，再获取可以缩放画面最大最小的参数
//                   mediaSize = MediaQuery.of(context).size;
//                   scale = 1 / (controller.value.aspectRatio * mediaSize!.aspectRatio);
//                   controller
//                       .getMaxZoomLevel()
//                       .then((double value) => _maxAvailableZoom = value);
//                   controller
//                       .getMinZoomLevel()
//                       .then((double value) => _minAvailableZoom = value);
//                   return _buildMainWidget();
//                 } else {
//                   // Otherwise, display a loading indicator.
//                   return const Center(child: CircularProgressIndicator());
//                 }
//               },
//             )
//             )
//           ],
//         ),
//         decoration: BoxDecoration(
//           color: Colors.black,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildMainWidget()=>Container(
//     child: Stack(
//       children: [
//         ClipRect(
//           clipper: _MediaSizeClipper(mediaSize!),
//           child: Transform.scale(
//             scale: scale,
//             alignment: Alignment.topCenter,
//             child: _cameraPreviewWidget(),
//           ),
//         ),
//         Positioned(
//             bottom: 50.0,
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const Text('轻触拍照',style: TextStyle(color: Colors.white),),
//                   SizedBox(height: 10.0,),
//                   GestureDetector(
//                     onTap: (){
//                       if(controller == null ||
//                           !controller.value.isInitialized){
//                         MyToast.toast(msg: '相机控制器暂未初始化完成\n请稍等重试...');
//                         return;
//                       }
//                       onTakePictureButtonPressed();
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: Colors.transparent
//                       ),
//                       child:Image.asset('images/icon_take_photo.png',width: 70.0,height: 70.0,),
//                     ),
//                   )
//                 ],
//               ),
//             )),
//         Positioned(
//             right: 20.0,
//             top: MediaQuery.of(context).padding.top+10.0,
//             child: GestureDetector(
//               onTap: (){
//                 NavigatorUtil.pop();
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.transparent
//                 ),
//                 child:Icon(
//                   Icons.close,
//                   color: Colors.white,
//                   size: 30.0,
//                 ),
//               ),
//             ))
//
//       ],
//     ),
//   );
//
//
//
//   /// Display the preview from the camera (or a message if the preview is not available).
//   Widget _cameraPreviewWidget() {
//     final CameraController cameraController = controller;
//
//     if (cameraController == null || !cameraController.value.isInitialized) {
//       return const Text(
//         'cameraController未初始化完成',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 24.0,
//           fontWeight: FontWeight.w900,
//         ),
//       );
//     } else {
//       return Listener(
//         onPointerDown: (_) => _pointers++,
//         onPointerUp: (_) => _pointers--,
//         child: CameraPreview(
//           controller,
//           child: LayoutBuilder(
//               builder: (BuildContext context, BoxConstraints constraints) {
//                 return GestureDetector(
//                   behavior: HitTestBehavior.opaque,
//                   onScaleStart: _handleScaleStart,
//                   onScaleUpdate: _handleScaleUpdate,
//                   onTapDown: (TapDownDetails details) =>
//                       onViewFinderTap(details, constraints),
//                 );
//               }),
//         ),
//       );
//     }
//   }
//
//   void _handleScaleStart(ScaleStartDetails details) {
//     _baseScale = _currentScale;
//   }
//
//   Future<void> _handleScaleUpdate(ScaleUpdateDetails details) async {
//     // When there are not exactly two fingers on screen don't scale
//     if (controller == null || _pointers != 2) {
//       return;
//     }
//
//     _currentScale = (_baseScale * details.scale)
//         .clamp(_minAvailableZoom, _maxAvailableZoom);
//
//     await controller.setZoomLevel(_currentScale);
//   }
//
//
//
//   String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
//
//   void showInSnackBar(String message) {
//     // ignore: deprecated_member_use
//     _scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text(message)));
//   }
//
//   void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
//     if (controller == null) {
//       return;
//     }
//
//     final CameraController cameraController = controller;
//
//     final Offset offset = Offset(
//       details.localPosition.dx / constraints.maxWidth,
//       details.localPosition.dy / constraints.maxHeight,
//     );
//     cameraController.setExposurePoint(offset);
//     cameraController.setFocusPoint(offset);
//   }
//
//   Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
//     if (controller != null) {
//       await controller.dispose();
//     }
//
//     final CameraController cameraController = CameraController(
//       cameraDescription,
//       kIsWeb ? ResolutionPreset.max : ResolutionPreset.medium,
//       enableAudio: enableAudio,
//       imageFormatGroup: ImageFormatGroup.jpeg,
//     );
//
//     controller = cameraController;
//
//     // If the controller is updated then update the UI.
//     cameraController.addListener(() {
//       if (mounted) {
//         setState(() {});
//       }
//       if (cameraController.value.hasError) {
//         showInSnackBar(
//             'Camera error ${cameraController.value.errorDescription}');
//       }
//     });
//
//     try {
//       await cameraController.initialize();
//       await Future.wait(<Future<Object>>[
//         // The exposure mode is currently not supported on the web.
//         ...!kIsWeb
//             ? <Future<Object>>[
//           cameraController.getMinExposureOffset().then(
//                   (double value) => _minAvailableExposureOffset = value),
//           cameraController
//               .getMaxExposureOffset()
//               .then((double value) => _maxAvailableExposureOffset = value)
//         ]
//             : <Future<Object>>[],
//         cameraController
//             .getMaxZoomLevel()
//             .then((double value) => _maxAvailableZoom = value),
//         cameraController
//             .getMinZoomLevel()
//             .then((double value) => _minAvailableZoom = value),
//       ]);
//     } on CameraException catch (e) {
//       _showCameraException(e);
//     }
//
//     if (mounted) {
//       setState(() {});
//     }
//   }
//
//   void onTakePictureButtonPressed() {
//     takePicture().then((XFile? file) {
//       if (mounted) {
//         if(file!=null){
//           widget.takePictureCallBack(file.name,file.path);
//           NavigatorUtil.pop();
//         }else{
//           MyToast.toast(msg: '拍照失败！未成功获取到拍照图片');
//         }
//         // setState(() {
//         //   imageFile = file;
//         // });
//         // if (file != null) {
//         //
//         //   showInSnackBar('Picture saved to ${file.path}');
//         //   print(file.name);
//         //   // NavigatorUtil.pop()
//         // }
//       }
//     });
//   }
//
//
//
//   Future<void> onCaptureOrientationLockButtonPressed() async {
//     try {
//       if (controller != null) {
//         final CameraController cameraController = controller;
//         if (cameraController.value.isCaptureOrientationLocked) {
//           await cameraController.unlockCaptureOrientation();
//           showInSnackBar('Capture orientation unlocked');
//         } else {
//           await cameraController.lockCaptureOrientation();
//           showInSnackBar(
//               'Capture orientation locked to ${cameraController.value.lockedCaptureOrientation.toString().split('.').last}');
//         }
//       }
//     } on CameraException catch (e) {
//       _showCameraException(e);
//     }
//   }
//
//   void onSetFlashModeButtonPressed(FlashMode mode) {
//     setFlashMode(mode).then((_) {
//       if (mounted) {
//         setState(() {});
//       }
//       showInSnackBar('Flash mode set to ${mode.toString().split('.').last}');
//     });
//   }
//
//   void onSetExposureModeButtonPressed(ExposureMode mode) {
//     setExposureMode(mode).then((_) {
//       if (mounted) {
//         setState(() {});
//       }
//       showInSnackBar('Exposure mode set to ${mode.toString().split('.').last}');
//     });
//   }
//
//   void onSetFocusModeButtonPressed(FocusMode mode) {
//     setFocusMode(mode).then((_) {
//       if (mounted) {
//         setState(() {});
//       }
//       showInSnackBar('Focus mode set to ${mode.toString().split('.').last}');
//     });
//   }
//
//   Future<void> setFlashMode(FlashMode mode) async {
//     if (controller == null) {
//       return;
//     }
//
//     try {
//       await controller.setFlashMode(mode);
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       rethrow;
//     }
//   }
//   ///曝光度的设置，
//   Future<void> setExposureMode(ExposureMode mode) async {
//     if (controller == null) {
//       return;
//     }
//
//     try {
//       await controller.setExposureMode(mode);
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       rethrow;
//     }
//   }
//
//   Future<void> setExposureOffset(double offset) async {
//     if (controller == null) {
//       return;
//     }
//
//     setState(() {
//       _currentExposureOffset = offset;
//     });
//     try {
//       offset = await controller.setExposureOffset(offset);
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       rethrow;
//     }
//   }
//
//   Future<void> setFocusMode(FocusMode mode) async {
//     if (controller == null) {
//       return;
//     }
//
//     try {
//       await controller.setFocusMode(mode);
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       rethrow;
//     }
//   }
//
//
//
//   Future<XFile?> takePicture() async {
//     final CameraController cameraController = controller;
//     if (cameraController == null || !cameraController.value.isInitialized) {
//       showInSnackBar('Error: select a camera first.');
//       return null;
//     }
//
//     if (cameraController.value.isTakingPicture) {
//       // A capture is already pending, do nothing.
//       return null;
//     }
//
//     try {
//       final XFile file = await cameraController.takePicture();
//       return file;
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       return null;
//     }
//   }
//
//   void _showCameraException(CameraException e) {
//     logError(e.code, e.description);
//     showInSnackBar('Error: ${e.code}\n${e.description}');
//   }
// }
//
// class _MediaSizeClipper extends CustomClipper<Rect> {
//   final Size mediaSize;
//   const _MediaSizeClipper(this.mediaSize);
//   @override
//   Rect getClip(Size size) {
//     return Rect.fromLTWH(0, 0, mediaSize.width, mediaSize.height);
//   }
//   @override
//   bool shouldReclip(CustomClipper<Rect> oldClipper) {
//     return true;
//   }
// }
//
//
//
//
// /// This allows a value of type T or T? to be treated as a value of type T?.
// ///
// /// We use this so that APIs that have become non-nullable can still be used
// /// with `!` and `?` on the stable branch.
// // TODO(ianh): Remove this once we roll stable in late 2021.
// T _ambiguate<T>(T value) => value;
//
