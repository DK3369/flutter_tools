/// 环境配置
/// flutter run
///  --dart-define=DARTDEFINE_APP_ENV=debug
///  --dart-define=DART_DEFINE_APP_ENV=release
///
class EnvConfig {
  final String appTitle;
  final String appDomain;
  final String wsDomain;
  EnvConfig({
    required this.appTitle,
    required this.appDomain,
    required this.wsDomain,
  });
}

/// 获取的配置信息
class Env {
  /// 获取到当前环境
  static const appEnv = String.fromEnvironment(EnvName.envKey);

  /// 预发环境
  static final EnvConfig _uatConfig = EnvConfig(
    appTitle: "uatTitle",
    appDomain: "http://im-gt-stg.mgtxxx.com",
    wsDomain: "ws://im-gt-stg.mgtxxx.com/message-ws",
  );

  /// 发布环境
  static final EnvConfig _releaseConfig = EnvConfig(
    appTitle: "releaseTitle",
    appDomain: "https://market-gateway.wwwbz941.com",
    wsDomain: "wss://market-gateway.wwwbz941.com/message-ws",
  );

  /// 测试环境
  static final EnvConfig _devConfig = EnvConfig(
    appTitle: "devTitle",
    appDomain: "http://im-gt-stg.mgtxxx.com", // "https://wwace50.com/v1",
    wsDomain: "wss://market-gateway.wwwbz941.com/message-ws",
    // wsDomain: "wss://wwace50.com/message-ws",
    // Global.developType = "";
  );

  static EnvConfig get envConfig => _getEnvConfig();

  /// 根据不同环境返回对应的环境配置
  static EnvConfig _getEnvConfig() {
    switch (appEnv) {
      case EnvName.uat:
        return _uatConfig;
      case EnvName.release:
        return _releaseConfig;
      case EnvName.dev:
        return _devConfig;
      default:
        return _uatConfig;
    }
  }
}

/// 声明的环境
abstract class EnvName {
  /// 环境key
  static const String envKey = "DART_DEFINE_APP_ENV";

  /// 环境value
  static const String uat = "uat";
  static const String release = "release";
  static const String dev = "dev";
}
