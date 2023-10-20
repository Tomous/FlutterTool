import 'package:flutter/foundation.dart';

class Env {
  static const String _development = 'https://www.hbgsyycx.cn';
  static const String _production = 'https://www.hbgsyycx.cn';

  static const String _developmentWS =
      "wss://www.hbgsyycx.cn/ihs/websocket/ws/appoint";
  static const String _productionWS =
      "wss://www.hbgsyycx.cn/ihs/websocket/ws/appoint";

  static String get serverBaseUrl {
    return kReleaseMode ? _production : _development;
  }

  static String get serverWebsocketUrl {
    return kReleaseMode ? _productionWS : _developmentWS;
  }
}
