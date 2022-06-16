import 'package:event_bus/event_bus.dart';

class EventBusUtils {
  static EventBus? EventBus_instance;

  static EventBus getInstance() {
    if (null == EventBus_instance) {
      EventBus_instance = new EventBus();
    }
    return EventBus_instance!;
  }
}

class StringContentEvent {
  String str;
  StringContentEvent(this.str);
}

// event 监听
class MyEventBus {
  //传递的数据
  dynamic data;
  //唯一标识码
  int? code;

  MyEventBus({this.data, this.code});
}


// event 监听
class MyEventBusString {
  //传递的数据
  String? data;
  //唯一标识码
  int? code;

  MyEventBusString({this.data, this.code});
}
