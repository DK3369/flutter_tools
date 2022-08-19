import 'package:flutter_tools/app/modules/mine/controllers/mine_controller.dart';
import 'package:get/get.dart';

/// 全局使用变量
class ProjectConfig {
  static const appName = "flutter工具";
  static const lang = "flutterTools";
}

class AllControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MineController());
  }
}
