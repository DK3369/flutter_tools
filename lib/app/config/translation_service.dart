import 'dart:ui';

import 'package:flutter_tools/app/config/config.dart';
import 'package:flutter_tools/app/config/en_us.dart';
import 'package:flutter_tools/app/config/zh_cn.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  // static Locale? get locale => Get.deviceLocale;
  static Locale? get locale => const Locale(ProjectConfig.lang);
  static const fallbackLocale = Locale(ProjectConfig.lang);
  @override
  Map<String, Map<String, String>> get keys => {
        'ZH_CN': ZH_CN,
        'EN_US': EN_US,
      };
}
