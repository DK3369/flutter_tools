import 'package:flutter_tools/app/http/api.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  //TODO: Implement NewsController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  // static const platform = const MethodChannel("samples.flutter.io/battery");
  // String _batteryLevel = 'Unknown battery level.';
  //
  // Future<Null> getBatteryLevel() async {
  //   // if(Platform.isAndroid){}
  //   String batteryLevel;
  //   try {
  //     final int result = await platform.invokeMethod('didSelectButtonClick');
  //     batteryLevel = 'Battery level at $result %.';
  //   } on PlatformException catch (e) {
  //     batteryLevel = "Failed to get battery level: '${e.message}'. ";
  //   }
  // }

  void testApi() {
    Api.test1("");

    Api.checkConnection();
    Api.checkVPN();
  }

  void testSocks5_2() {
    Api.testSocks5_2();
  }
}
