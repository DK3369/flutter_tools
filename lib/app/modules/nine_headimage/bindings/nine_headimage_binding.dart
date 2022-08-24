import 'package:get/get.dart';

import '../controllers/nine_headimage_controller.dart';

class NineHeadimageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NineHeadimageController>(
      () => NineHeadimageController(),
    );
  }
}
