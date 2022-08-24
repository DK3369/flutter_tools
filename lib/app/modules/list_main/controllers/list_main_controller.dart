import 'package:get/get.dart';

class ListMainController extends GetxController {
  //TODO: Implement ListMainController

  var list = [
    {
      "title": "默认样式",
      "Action": "",
    },
    {
      "title": "升级样式",
      "Action": "",
    },
    {
      "title": "其他样式",
      "Action": "",
    },
  ];

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
}
