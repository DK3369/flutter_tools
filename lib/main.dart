import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tools/app/config/config.dart';
import 'package:flutter_tools/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'global.dart';

// void main() {
//   runApp(const MyApp());
// }
Future<void> main() async {
  await Global.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return RefreshConfiguration(
            headerBuilder: () => ClassicHeader(),
            footerBuilder: () => ClassicFooter(),
            hideFooterWhenNotFull: true,
            headerTriggerDistance: 80,
            maxOverScrollExtent: 100,
            footerTriggerDistance: 150,
            child: GetMaterialApp(
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
            ),
          );
        });
  }
}
