import 'package:get/get.dart';

import '../modules/Test1/bindings/test1_binding.dart';
import '../modules/Test1/views/test1_view.dart';
import '../modules/Test2/bindings/test2_binding.dart';
import '../modules/Test2/views/test2_view.dart';
import '../modules/Test3/bindings/test3_binding.dart';
import '../modules/Test3/views/test3_view.dart';
import '../modules/Test4/bindings/test4_binding.dart';
import '../modules/Test4/views/test4_view.dart';
import '../modules/Test5/bindings/test5_binding.dart';
import '../modules/Test5/views/test5_view.dart';
import '../modules/bottom_navigation/bindings/bottom_navigation_binding.dart';
import '../modules/bottom_navigation/views/bottom_navigation_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/local_notifications/bindings/local_notifications_binding.dart';
import '../modules/local_notifications/views/local_notifications_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/mine/bindings/mine_binding.dart';
import '../modules/mine/views/mine_view.dart';
import '../modules/movies/bindings/movies_binding.dart';
import '../modules/movies/views/movies_view.dart';
import '../modules/news/bindings/news_binding.dart';
import '../modules/news/views/news_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BOTTOM_NAVIGATION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MINE,
      page: () => const MineView(),
      binding: MineBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.NEWS,
      page: () => const NewsView(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVIGATION,
      page: () => const BottomNavigationView(),
      binding: BottomNavigationBinding(),
    ),
    GetPage(
      name: _Paths.MOVIES,
      page: () => MoviesView(),
      binding: MoviesBinding(),
    ),
    GetPage(
      name: _Paths.TEST1,
      page: () => const Test1View(),
      binding: Test1Binding(),
    ),
    GetPage(
      name: _Paths.TEST2,
      page: () => const Test2View(),
      binding: Test2Binding(),
    ),
    GetPage(
      name: _Paths.TEST3,
      page: () => const Test3View(),
      binding: Test3Binding(),
    ),
    GetPage(
      name: _Paths.TEST4,
      page: () => const Test4View(),
      binding: Test4Binding(),
    ),
    GetPage(
      name: _Paths.TEST5,
      page: () => const Test5View(),
      binding: Test5Binding(),
    ),
    GetPage(
      name: _Paths.LOCAL_NOTIFICATIONS,
      page: () => const LocalNotificationsView(),
      binding: LocalNotificationsBinding(),
    ),
  ];
}
