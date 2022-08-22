import 'package:flutter/material.dart';

class DialogUtil {
  static get data => null;

  /**
   * 通用显示确定按钮框
   */
  static showConfirmDialog(context, options) {
    showDialog(
        context: context,
        // 点击背景区域是否可以关闭
        barrierDismissible: options["barrierDismissible"] ?? true,
        builder: (BuildContext context) {
          return _ConfirmDialog(
              title: options["title"],
              okCallback: options["confirm"],
              cancelCallBack: options["cancel"], key: null,);
        });
  }

  static showCustomerChargeCoinQrcodeDialog(
      BuildContext context, String qrcodeData, options) {
    showDialog(
        context: context,
        // 点击背景区域是否可以关闭
        barrierDismissible: options["barrierDismissible"] ?? true,
        builder: (BuildContext context) {
          return _ConfirmDialog(data: data, cancelCallBack: options["close"], title: qrcodeData);
        });
  }
}

/**
 *  确认弹框类
 */
class _ConfirmDialog extends Dialog {
  _ConfirmDialog(
      {key,
      required this.title,
      // 取消事件回调
      this.cancelCallBack,
      // 确定事件回调
      this.okCallback, data})
      ;
  final String title;
  final cancelCallBack;
  final okCallback;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //  屏蔽安卓的手机返回键
      onWillPop: () async {
        return Future.value(false);
      },
      child: AlertDialog(
        title: Text(title ?? '确定****?'),
        actions: <Widget>[
          TextButton(
            child: Text('取消'),
            onPressed: () {
              Navigator.pop(context, false);
              if (cancelCallBack != null) {
                cancelCallBack();
              }
            },
          ),
          TextButton(
            child: Text('确定'),
            onPressed: () {
              Navigator.pop(context, true);
              if (okCallback != null) {
                okCallback();
              }
            },
          ),
        ],
      ),
    );
  }
}

/**
 * 自定义弹框
 */
class _CustomerDialog extends Dialog {
  var data;

  _CustomerDialog(
      {required Key key,
      this.data,
      // 关闭事件回调
      this.closeCallback})
      : super(key: key);
  final closeCallback;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: 865,
            width: 590,
            child: GestureDetector(
              onTap: () {
                // 点击关闭事件
                if (closeCallback != null) {
                  closeCallback();
                }
                Navigator.pop(context, true);
              },
              child: Image.asset(
                "assets/images/popup_shut.png",
                width: 62,
                height: 92,
              ),
            )));
  }
}
