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

  /// 登陆接口
  /// 使用
  ///   Api.login({params}).then((value) {
  ///       print("login.value = $value");
  ///     });
  ///
  static test1(params) async {
    //   DioResponse result = await DioUtil()
    //       .request(
    //         URL.LOGIN,
    //         method: DioMethod.post,
    //         params: params,
    //       )
    //       .catchError((e) {});
    //   if (result.data['code'] == '200') {
    //     print("这里json 转model ，返回给controller model");
    //     return result.data;
    //   } else {
    //     print("在这里处理各种异常、弹窗，尽量不要返回controller");
    //   }
    // }

    // 地址     : 49.157.15.130
    // 端口     : 12581
    // 密码     : 112211
    // 加密     : aes-256-gcm
    // 插件程序 : v2ray-plugin
    // 插件选项 : host=cloudfront.com;path=/test1;mux=8
    // ss://YWVzLTI1Ni1nY206MTEyMjEx@49.157.15.130:12581/?plugin=v2ray-plugin%3Bhost%3Dcloudfront.com%3Bpath%3D%2Ftest1%3Bmux%3D8

    // proxy socks -T ssh -P "10.8.20.46:22" -u user -D 123123 -t tcp -p ":28080"  --udp-port 0 --udp
    // SocksProxy.initProxy(proxy: 'SOCKS5 10.8.20.46:12581');
    SocksProxy.initProxy(proxy: 'SOCKS5 ss://YWVzLTI1Ni1nY206MTEyMjEx@10.8.20.46:12581');

    // SocksProxy.initProxy(proxy: 'SOCKS5 2:123123@10.8.20.46:12581');
    print("1111");
    await HttpClient()
        .getUrl(
            Uri.parse('https://raw.githubusercontent.com/tayoji-io/socks_proxy/master/README.md'))
        .then((value) {
          print("value111 = $value");
          return value.close();
        })
        .then((value) {
          print("value222 = $value");

          return value.transform(utf8.decoder);
        })
        .then((value) {
          print("value333 = $value");

          return value.fold('', (dynamic previous, element) => previous + element);
        })
        .then((value) => print(value))
        .catchError((e) => print(e));
    // SocksProxy.setProxy('SOCKS4 192.168.31.180:7891');

    // test('Independent test', () async {
    //   // proxy -> "SOCKS5/SOCKS4/PROXY username:password@host:port;" or "DIRECT"
    //   final http = createProxyHttpClient()..findProxy = (url) => 'SOCKS5 192.168.31.180:7891';
    //   await http
    //       .getUrl(
    //       Uri.parse('https://raw.githubusercontent.com/tayoji-io/socks_proxy/master/README.md'))
    //       .then((value) {
    //     return value.close();
    //   })
    //       .then((value) {
    //     return value.transform(utf8.decoder);
    //   })
    //       .then((value) {
    //     return value.fold('', (dynamic previous, element) => previous + element);
    //   })
    //       .then((value) => print(value))
    //       .catchError((e) => print(e));
    // });
  }

  static testSocks5_2() async {
    print("testSocks5_2");

    // /// [SOCKSSocket] uses a raw socket to authorize
    // /// and request a connection, connect to your socks proxy server
    // final sock = await RawSocket.connect(InternetAddress.loopbackIPv4, 9050);
    //
    // /// pass the socket to [SOCKSSocket]
    // final proxy = SOCKSSocket(sock);
    //
    // /// request the proxy to connect to a host
    // /// this call will throw exceptions if connection attempt fails from the proxy
    // await proxy.connect("google.com:80");
    //
    // /// Now you can use the [sock] from earlier, since we can only listen
    // /// once on a [RawSocket] we must set the [onData] function to intercept
    // /// the events from the socket
    // proxy.subscription.onData((RawSocketEvent event) {
    //   /// [RawSocketEvent] messages are here
    //   /// read from here..
    //   if (event == RawSocketEvent.read) {
    //     final data = sock.read(sock.available());
    //     print("Got ${data?.length} bytes");
    //   }
    // });
    //
    // /// To connect with an [InternetAddress] use:
    // /// await s.connectIp(InternetAddress.loopbackIPv4, 80);
    //
    // /// keepOpen=false will call close the [RawSocket]
    // await proxy.close(keepOpen: false);
  }

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
