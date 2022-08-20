import 'package:get/get.dart';

import '../controllers/test5_controller.dart';

class Test5Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Test5Controller>(
      () => Test5Controller(),
    );
  }
}
