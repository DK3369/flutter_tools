import 'package:get/get.dart';

import '../controllers/local_notifications_controller.dart';

class LocalNotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalNotificationsController>(
      () => LocalNotificationsController(),
    );
  }
}
