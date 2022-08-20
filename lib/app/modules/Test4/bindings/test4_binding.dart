import 'package:get/get.dart';

import '../controllers/test4_controller.dart';

class Test4Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Test4Controller>(
      () => Test4Controller(),
    );
  }
}
