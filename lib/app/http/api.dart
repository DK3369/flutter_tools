import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tools/app/http/flutter_socks_proxy/check_vpn_connection.dart';
import 'package:flutter_tools/global.dart';
import 'package:network_info_plus/network_info_plus.dart';
// import 'package:socks5/socks5.dart';
import 'package:vpn_check/vpn_check.dart';

import 'flutter_socks_proxy/socks_proxy.dart';

/// topic 前面加 jl1
///  proxy -> "SOCKS5/SOCKS4/PROXY username:password@hots:port" or "DIRECT"
var urlString = 'PROXY 152.32.186.236:38080';

// var urlString = 'SOCKS5 34.92.245.49:36668';
// var urlString = 'PROXY 34.92.245.49:36668';
// var urlString = 'DIRECT 34.92.245.49:36668';

// var urlIP = 'https://httpbin.org/ip';
var urlIP = 'https://ifconfig.me';

var httpClient = HttpClient();
var directRequestURL = "https://ifconfig.me/ip";
// var directRequestURL = 'https://httpbin.org/ip';

var listOKIP = [];

enum Season {
  SPRING('春天'),
  SUMMER('夏天'),
  AUTUMN('秋天'),
  WINTER('冬天');

  final String seasonName;
  const Season(this.seasonName);

  @override
  String toString() => 'The $name is $seasonName';
}

class Api {
  static Api? shared;

  static Api? getShared() {
    if (null == shared) shared = Api();
    print(Season.AUTUMN);
    return shared;
  }

  /// #网络变化 网络状态
  static Future<void> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
    }
    Global.myLog("connectivityResult = $connectivityResult", StackTrace.current);

    var subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!
      Global.myLog("跟踪网络变化 result =$result", StackTrace.current);
      if (result == 1 || result == 3) {}
    });
    initNetworkInfo();
  }

  /// 检测是否是vpn链接
  static Future<void> checkVPN() async {
    if (await CheckVpnConnection.isVpnActive()) {
      // do some action if VPN connection status is true
      print("checkVPN  isVpnActive");
    }

    try {
      bool isVpnActive = await VPNCheck.isVpnActive;
      Global.myLog("_isVpnActive = $isVpnActive", StackTrace.current);
    } on VPNUnhandledException catch (e) {
      Global.myLog(e, StackTrace.current);
    }
  }

  static getMyIP() async {
    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(urlIP));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        result = data['origin'];
      } else {
        result = 'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address $exception';
    }
    print("我的ip result = $result");
  }

  /// 登陆接口
  /// 使用
  ///   Api.login({params}).then((value) {
  ///       print("login.value = $value");
  ///     });
  ///
  static test1(params) async {
    getMyIP();

    testSocks1(urlString);
  }

  static testSocks1(String urlString) async {
    SocksProxy.initProxy(proxy: urlString);
    await HttpClient().getUrl(Uri.parse(directRequestURL)).then((value) {
      print("=========== value111 = $value");
      listOKIP.add(urlString);
      print("=========== listOKIP = $listOKIP");
      return value.close();
    }).then((value) {
      print("=========== value222 = $value");

      return value.transform(utf8.decoder);
    }).then((value) {
      print("=========== value333 = $value");

      return value.fold('', (dynamic previous, element) => previous + element);
    }).then((value) {
      print("=========== 11111 value = $value");
      getMyIP();
    }).catchError((e) => print("=========== e = $e"));
  }

  static testSocks(String urlString) async {
    // proxy -> "SOCKS5/SOCKS4/PROXY username:password@host:port;" or "DIRECT"
    final http = createProxyHttpClient()..findProxy = (url) => urlString;

    print("=========== http  = $http");

    await http.getUrl(Uri.parse(directRequestURL)).then((value) {
      print("value111 = $value");
      return value.close();
    }).then((value) {
      print("value111 = $value");
      return value.transform(utf8.decoder);
    }).then((value) {
      print("value111 = $value");
      return value.fold('', (dynamic previous, element) => previous + element);
    }).then((value) {
      print("=========== 11111 value = $value");
      getMyIP();
    }).catchError((e) => print("eeee = $e"));
  }

  static testSocks5_2() async {
    testSocks(urlString);
    print("testSocks5_2");
  }

  /**
   * 获取网络信息
   * */
  static Future<void> initNetworkInfo() async {
    String _connectionStatus = 'Unknown';
    final NetworkInfo _networkInfo = NetworkInfo();

    String? wifiName, wifiBSSID, wifiIPv4, wifiIPv6, wifiGatewayIP, wifiBroadcast, wifiSubmask;

    try {
      if (!kIsWeb && Platform.isIOS) {
        var status = await _networkInfo.getLocationServiceAuthorization();
        if (status == LocationAuthorizationStatus.notDetermined) {
          status = await _networkInfo.requestLocationServiceAuthorization();
        }
        if (status == LocationAuthorizationStatus.authorizedAlways ||
            status == LocationAuthorizationStatus.authorizedWhenInUse) {
          wifiName = await _networkInfo.getWifiName();
        } else {
          wifiName = await _networkInfo.getWifiName();
        }
      } else {
        wifiName = await _networkInfo.getWifiName();
      }
    } on PlatformException catch (e) {
      // developer.log('Failed to get Wifi Name', error: e);
      wifiName = 'Failed to get Wifi Name';
      Global.myLog("Failed to get Wifi Name  $e", StackTrace.current);
    }

    try {
      if (!kIsWeb && Platform.isIOS) {
        var status = await _networkInfo.getLocationServiceAuthorization();
        if (status == LocationAuthorizationStatus.notDetermined) {
          status = await _networkInfo.requestLocationServiceAuthorization();
        }
        if (status == LocationAuthorizationStatus.authorizedAlways ||
            status == LocationAuthorizationStatus.authorizedWhenInUse) {
          wifiBSSID = await _networkInfo.getWifiBSSID();
        } else {
          wifiBSSID = await _networkInfo.getWifiBSSID();
        }
      } else {
        wifiBSSID = await _networkInfo.getWifiBSSID();
      }
    } on PlatformException catch (e) {
      // developer.log('Failed to get Wifi BSSID', error: e);
      wifiBSSID = 'Failed to get Wifi BSSID';
      Global.myLog("Failed to get Wifi BSSID  $e", StackTrace.current);
    }

    try {
      wifiIPv4 = await _networkInfo.getWifiIP();
    } on PlatformException catch (e) {
      // developer.log('Failed to get Wifi IPv4', error: e);
      wifiIPv4 = 'Failed to get Wifi IPv4';
      Global.myLog("Failed to get Wifi IPv4  $e", StackTrace.current);
    }

    try {
      wifiIPv6 = await _networkInfo.getWifiIPv6();
    } on PlatformException catch (e) {
      // developer.log('Failed to get Wifi IPv6', error: e);
      wifiIPv6 = 'Failed to get Wifi IPv6';
      Global.myLog("Failed to get Wifi IPv6  $e", StackTrace.current);
    }

    try {
      wifiSubmask = await _networkInfo.getWifiSubmask();
    } on PlatformException catch (e) {
      // developer.log('Failed to get Wifi submask address', error: e);
      wifiSubmask = 'Failed to get Wifi submask address';
      Global.myLog("Failed to get Wifi submask address  $e", StackTrace.current);
    }

    try {
      wifiBroadcast = await _networkInfo.getWifiBroadcast();
    } on PlatformException catch (e) {
      // developer.log('Failed to get Wifi broadcast', error: e);
      wifiBroadcast = 'Failed to get Wifi broadcast';
      Global.myLog("Failed to get Wifi broadcast   $e", StackTrace.current);
    }

    try {
      wifiGatewayIP = await _networkInfo.getWifiGatewayIP();
    } on PlatformException catch (e) {
      // developer.log('Failed to get Wifi gateway address', error: e);
      wifiGatewayIP = 'Failed to get Wifi gateway address';
      Global.myLog("Failed to get Wifi gateway address   $e", StackTrace.current);
    }

    try {
      wifiSubmask = await _networkInfo.getWifiSubmask();
    } on PlatformException catch (e) {
      // developer.log('Failed to get Wifi submask', error: e);
      wifiSubmask = 'Failed to get Wifi submask';
      Global.myLog("Failed to get Wifi submask    $e", StackTrace.current);
    }

    _connectionStatus = 'Wifi Name: $wifiName\n'
        'Wifi BSSID: $wifiBSSID\n'
        'Wifi IPv4: $wifiIPv4\n'
        'Wifi IPv6: $wifiIPv6\n'
        'Wifi Broadcast: $wifiBroadcast\n'
        'Wifi Gateway: $wifiGatewayIP\n'
        'Wifi Submask: $wifiSubmask\n';

    Global.myLog("网络信息： $_connectionStatus", StackTrace.current);
  }
}
