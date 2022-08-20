import 'package:flutter_tools/app/modules/movies/controllers/movies_controller.dart';
import 'package:get/get.dart';

import '../../news/controllers/news_controller.dart';
import '../controllers/bottom_navigation_controller.dart';

class BottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationController>(
      () => BottomNavigationController(),
    );
    Get.lazyPut<NewsController>(
      () => NewsController(),
    );
    Get.lazyPut<MoviesController>(
      () => MoviesController(),
    );
  }
}
