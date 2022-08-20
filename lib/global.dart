import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';

import 'app/utils/log_util.dart';

/// 全局静态数据
class Global {
  static myLog(Object message, StackTrace current) {
    CustomTrace programInfo = CustomTrace(current);
    print("\n {文件: ${programInfo.fileName}, 行: ${programInfo.lineNumber}, 打印信息: $message}");
  }

  /// 初始化
  static Future init() async {
    initServices();
    WidgetsFlutterBinding.ensureInitialized();
    // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // setSystemUi();
    // Loading();
    //
    // await Get.putAsync<StorageService>(() => StorageService().init());
    //
    // Get.put<ConfigStore>(ConfigStore());
    // Get.put<UserStore>(UserStore());
  }

  // static void setSystemUi() {
  //   if (GetPlatform.isAndroid) {
  //     SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
  //       statusBarColor: Colors.transparent,
  //       statusBarBrightness: Brightness.light,
  //       statusBarIconBrightness: Brightness.dark,
  //       systemNavigationBarDividerColor: Colors.transparent,
  //       systemNavigationBarColor: Colors.white,
  //       systemNavigationBarIconBrightness: Brightness.dark,
  //     );
  //     SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  //   }
  // }
}

Future<void> initServices() async {
  print('starting services ...');

  ///这里是你放get_storage、hive、shared_pref初始化的地方。
  ///或者moor连接，或者其他什么异步的东西。
  await SpUtil.getInstance();
  // await Get.putAsync(() => AuthService().init());
  // Get.put(AuthService().init());
  // await Get.putAsync(SettingsService()).init();
  print('All services started... SpUtil,AuthService');
}
