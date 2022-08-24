import 'package:get/get.dart';

import '../controllers/list_main_controller.dart';

class ListMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListMainController>(
      () => ListMainController(),
    );
  }
}
