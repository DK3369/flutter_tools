import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DKDeviceInfo {
  static DKDeviceInfo? _single;
  DKDeviceInfo._();

  static DKDeviceInfo instance() {
    return _single ??= DKDeviceInfo._();
  }

  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};
/**
 * 输出系统硬件信息
 * */
  Future<void> testInfo() async {
    initPlatformState();
    printScreenInformation();
    isVpnActive();
  }

  /**
   * 输出关于屏幕和比例的信息
   * */
  Future<void> printScreenInformation() async {
    print('设备宽度:${1.sw}dp');
    print('设备高度:${1.sh}dp');
    print('设备的像素密度:${ScreenUtil().pixelRatio}');
    print('底部安全区距离:${ScreenUtil().bottomBarHeight}dp');
    print('状态栏高度:${ScreenUtil().statusBarHeight}dp');
    print('实际宽度和字体(dp)与设计稿(dp)的比例:${ScreenUtil().scaleWidth}');
    print('实际高度(dp)与设计稿(dp)的比例:${ScreenUtil().scaleHeight}');
    print('高度相对于设计稿放大的比例:${ScreenUtil().scaleHeight}');
    print('系统的字体缩放比例:${ScreenUtil().textScaleFactor}');
    print('屏幕宽度的0.5:${0.5.sw}dp');
    print('屏幕高度的0.5:${0.5.sh}dp');
    print('屏幕方向:${ScreenUtil().orientation}');
  }

  Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};

    try {
      if (kIsWeb) {
        deviceData = _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
      } else {
        if (Platform.isAndroid) {
          deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        } else if (Platform.isIOS) {
          deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
          String str = iOSNameTransition(deviceData["utsname.machine:"]);
          print("\n iOS的设备型号是 = $str \n");
        } else if (Platform.isLinux) {
          deviceData = _readLinuxDeviceInfo(await deviceInfoPlugin.linuxInfo);
        } else if (Platform.isMacOS) {
          deviceData = _readMacOsDeviceInfo(await deviceInfoPlugin.macOsInfo);
        } else if (Platform.isWindows) {
          deviceData = _readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo);
        }
      }
    } on PlatformException {
      deviceData = <String, dynamic>{'Error:': 'Failed to get platform version.'};
    }
    // if (!mounted) return;

    _deviceData = deviceData;
    print("deviceData_deviceData = $_deviceData");
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      // 'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  Map<String, dynamic> _readLinuxDeviceInfo(LinuxDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'version': data.version,
      'id': data.id,
      'idLike': data.idLike,
      'versionCodename': data.versionCodename,
      'versionId': data.versionId,
      'prettyName': data.prettyName,
      'buildId': data.buildId,
      'variant': data.variant,
      'variantId': data.variantId,
      'machineId': data.machineId,
    };
  }

  Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
    return <String, dynamic>{
      'browserName': describeEnum(data.browserName),
      'appCodeName': data.appCodeName,
      'appName': data.appName,
      'appVersion': data.appVersion,
      'deviceMemory': data.deviceMemory,
      'language': data.language,
      'languages': data.languages,
      'platform': data.platform,
      'product': data.product,
      'productSub': data.productSub,
      'userAgent': data.userAgent,
      'vendor': data.vendor,
      'vendorSub': data.vendorSub,
      'hardwareConcurrency': data.hardwareConcurrency,
      'maxTouchPoints': data.maxTouchPoints,
    };
  }

  Map<String, dynamic> _readMacOsDeviceInfo(MacOsDeviceInfo data) {
    return <String, dynamic>{
      'computerName': data.computerName,
      'hostName': data.hostName,
      'arch': data.arch,
      'model': data.model,
      'kernelVersion': data.kernelVersion,
      'osRelease': data.osRelease,
      'activeCPUs': data.activeCPUs,
      'memorySize': data.memorySize,
      'cpuFrequency': data.cpuFrequency,
      'systemGUID': data.systemGUID,
    };
  }

  Map<String, dynamic> _readWindowsDeviceInfo(WindowsDeviceInfo data) {
    return <String, dynamic>{
      'numberOfCores': data.numberOfCores,
      'computerName': data.computerName,
      'systemMemoryInMegabytes': data.systemMemoryInMegabytes,
    };
  }

  ///获取设备信息
  static get deviceInfo async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    DeviceEntity deviceData;
    AndroidDeviceInfo? androidInfo;
    IosDeviceInfo? iosInfo;
    if (Platform.isIOS) {
      iosInfo = await deviceInfoPlugin.iosInfo;
    } else {
      androidInfo = await deviceInfoPlugin.androidInfo;
    }
    deviceData = _getDeviceEntity(androidInfo, iosInfo);
    return deviceData;
  }

  static DeviceEntity _getDeviceEntity(AndroidDeviceInfo? androidInfo, IosDeviceInfo? iosInfo) {
    return DeviceEntity(
        brand: Platform.isIOS
            ? DKDeviceInfo.iOSNameTransition(iosInfo?.utsname.machine ?? "")
            : "${androidInfo?.brand} ${androidInfo?.model}",
        systemVersion: Platform.isIOS ? iosInfo?.systemVersion : androidInfo?.version.release,
        platform: Platform.isIOS ? iosInfo?.systemName : "Android",
        isPhysicalDevice:
            Platform.isIOS ? iosInfo?.isPhysicalDevice : androidInfo?.isPhysicalDevice,
        // uuid: Platform.isIOS ? iosInfo?.identifierForVendor : androidInfo?.androidId);
        uuid: Platform.isIOS ? iosInfo?.identifierForVendor : androidInfo?.id);
  }

  ///根据设备 iosInfo?.utsname.machine 转换为 手机通用名称 例如 'iPhone7,1' 转为 iPhone 6 Plus  具体机型

  static String iOSNameTransition(String machine) {
    switch (machine) {
      case "iPod5,1":
        return "iPod Touch 5";
      case "iPod7,1":
        return "iPod Touch 6";
      case "iPhone3,1":
        return "iPhone 4";
      case "iPhone3,2":
        return "iPhone 4";
      case "iPhone3,3":
        return "iPhone 4";
      case "iPhone4,1":
        return "iPhone 4s";
      case "iPhone5,1":
        return "iPhone 5";
      case "iPhone5,2":
        return "iPhone 5";
      case "iPhone5,3":
        return "iPhone 5c";
      case "iPhone5,4":
        return "iPhone 5c";
      case "iPhone6,1":
        return "iPhone 5s";
      case "iPhone6,2":
        return "iPhone 5s";
      case "iPhone7,2":
        return "iPhone 6";
      case "iPhone7,1":
        return "iPhone 6 Plus";
      case "iPhone8,1":
        return "iPhone 6s";
      case "iPhone8,2":
        return "iPhone 6s Plus";
      case "iPhone8,4":
        return "iPhone SE";
      case "iPhone9,1":
        return "iPhone 7";
      case "iPhone9,3":
        return "iPhone 7";
      case "iPhone9,2":
        return "iPhone 7 Plus";
      case "iPhone9,4":
        return "iPhone 7 Plus";
      case "iPhone10,1":
        return "iPhone 8";
      case "iPhone10,4":
        return "iPhone 8";
      case "iPhone10,2":
        return "iPhone 8 Plus";
      case "iPhone10,5":
        return "iPhone 8 Plus";
      case "iPhone10,3":
        return "iPhone X";
      case "iPhone10,6":
        return "iPhone X";
      case "iPhone11,8":
        return "iPhone XR";
      case "iPhone11,2":
        return "iPhone XS";
      case "iPhone11,6":
        return "iPhone XS Max";
      case "iPhone11,4":
        return "iPhone XS Max";
      case "iPhone12,1":
        return "iPhone 11";
      case "iPhone12,3":
        return "iPhone 11 Pro";
      case "iPhone12,5":
        return "iPhone 11 Pro Max";
      case "iPhone13,1":
        return "iPhone 12 mini";
      case "iPhone13,2":
        return "iPhone 12";
      case "iPhone13,3":
        return "iPhone 12 Pro";
      case "iPhone13,4":
        return "iPhone 12 Pro Max";
      case "iPhone14,4":
        return "iPhone 13 mini";
      case "iPhone14,5":
        return "iPhone 13";
      case "iPhone14,2":
        return "iPhone 13 Pro";
      case "iPhone14,3":
        return "iPhone 13 Pro Max";

      case "iPad2,1":
        return "iPad 2";
      case "iPad2,2":
        return "iPad 2";
      case "iPad2,3":
        return "iPad 2";
      case "iPad2,4":
        return "iPad 2";

      case "iPad3,1":
        return "iPad 3";
      case "iPad3,2":
        return "iPad 3";
      case "iPad3,3":
        return "iPad 3";

      case "iPad3,4":
        return "iPad 4";
      case "iPad3,5":
        return "iPad 4";
      case "iPad3,6":
        return "iPad 4";

      case "iPad4,1":
        return "iPad Air";
      case "iPad4,2":
        return "iPad Air";
      case "iPad4,3":
        return "iPad Air";

      case "iPad5,3":
        return "iPad Air 2";
      case "iPad5,4":
        return "iPad Air 2";

      case "iPad2,5":
        return "iPad Mini";
      case "iPad2,6":
        return "iPad Mini";
      case "iPad2,7":
        return "iPad Mini";

      case "iPad4,4":
        return "iPad Mini 2";
      case "iPad4,5":
        return "iPad Mini 2";
      case "iPad4,6":
        return "iPad Mini 2";

      case "iPad4,7":
        return "iPad Mini 3";
      case "iPad4,8":
        return "iPad Mini 3";
      case "iPad4,9":
        return "iPad Mini 3";

      case "iPad5,1":
        return "iPad Mini 4";
      case "iPad5,2":
        return "iPad Mini 4";

      case "iPad6,7":
        return "iPad Pro";
      case "iPad6,8":
        return "iPad Pro";

      case "AppleTV5,3":
        return "Apple TV";
      case "i386":
        return "Simulator";
      case "x86_64":
        return "Simulator";
      default:
        return "iPhone unknown";
    }
  }

  /// 如果设备具有 VPN 连接，返回 true
  static Future<bool> isVpnActive() async {
    bool isVpnActive;
    List<NetworkInterface> interfaces =
        await NetworkInterface.list(includeLoopback: false, type: InternetAddressType.any);
    interfaces.isNotEmpty
        ? isVpnActive = interfaces.any((interface) =>
            interface.name.contains("tun") ||
            interface.name.contains("ppp") ||
            interface.name.contains("pptp"))
        : isVpnActive = false;
    print("isVpnActive $isVpnActive");
    return isVpnActive;
  }
}

class DeviceEntity {
  String? brand;
  String? systemVersion;
  String? platform;
  bool? isPhysicalDevice;
  String? uuid;

  DeviceEntity(
      {required this.brand,
      required this.systemVersion,
      required this.platform,
      required this.isPhysicalDevice,
      required this.uuid});
}
