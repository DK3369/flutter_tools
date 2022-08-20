import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tools/app/common/styles/theme.dart';
import 'package:flutter_tools/app/config/config.dart';
import 'package:flutter_tools/app/routes/app_pages.dart';
import 'package:get/get.dart';

import 'app/config/translation_service.dart';
import 'global.dart';

// void main() {
//   runApp(const MyApp());
// }
Future<void> main() async {
  await Global.init();
  runApp(MyApp());

  /// 全局控制print打印
  // runZonedGuarded(() {
  //   runApp(const App());
  // }, (error, stackTrace) {
  //   print(stackTrace);
  // }, zoneSpecification:
  //     ZoneSpecification(print: (Zone self, ZoneDelegate parent, Zone zone, String message) {
  //   if (kDebugMode) {
  //     parent.print(zone, "wrapped content=$message");
  //   }
  // }));

  // DoKit.runApp(app:DoKitApp(MyApp()),
  //     // 是否在release包内使用，默认release包会禁用
  //     useInRelease: true,
  //     // 选择性控制是否使用dokit中的runZonedGuarded,false: 禁用；true: 启用
  //     useRunZoned: false,
  //     releaseAction: () => {
  //       // release模式下执行该函数，一些用到runZone之类实现的可以放到这里，该值为空则会直接调用系统的runApp(MyApp())，
  //     })
}

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          // return RefreshConfiguration(
          //   headerBuilder: () => const ClassicHeader(),
          //   footerBuilder: () => const ClassicFooter(),
          //   hideFooterWhenNotFull: true,
          //   headerTriggerDistance: 80,
          //   maxOverScrollExtent: 100,
          //   footerTriggerDistance: 150,
          //   child:
          return GetMaterialApp(
            title: ProjectConfig.appName,
            // theme: AppTheme.light,
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.native,
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            initialBinding: AllControllerBinding(),
            theme: ThemeData(
              primarySwatch: Colors.amber,
              primaryColor: Colors.green,
              scaffoldBackgroundColor: Colors.white,
              //   appBarTheme: AppBarTheme(
              //     color: Colors.red,
              //     elevation: 0,
              //     iconTheme: IconThemeData(color: Colors.black),
              //     titleTextStyle: TextStyle(color: Color.fromRGBO(81, 91, 124, 1), fontSize: 32.sp),
              //   ),
            ),
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.system,
            navigatorObservers: [routeObserver],
            locale: TranslationService.locale,
            fallbackLocale: TranslationService.fallbackLocale,
            translations: TranslationService(),
            // builder: EasyLoading.init(),
            // translations: TranslationService(),
            // navigatorObservers: [AppPages.observer],
            // localizationsDelegates: [
            // GlobalMaterialLocalizations.delegate,
            // GlobalWidgetsLocalizations.delegate,
            // GlobalCupertinoLocalizations.delegate,
            // ],
            // supportedLocales: ConfigStore.to.languages,
            // locale: ConfigStore.to.locale,
            // fallbackLocale: Locale('en', 'US'),
            // enableLog: true,
            // logWriterCallback: Logger.write,
            // ),
          );
          // );
        });
  }
}

// typedef LotteryCallBack(List<LotteryBean> data);
typedef LotteryBetCallBack(data);
typedef StringCallBack(data);
