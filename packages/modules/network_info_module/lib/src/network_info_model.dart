import 'dart:async';

import 'package:network_info_plus/network_info_plus.dart';
import 'package:flutter/foundation.dart';

class NetworkInfoModel extends ChangeNotifier {
  NetworkInfoModel(this._networkInfo);

  final NetworkInfo _networkInfo;
  String? _wifiName;
  String? _wifiBSSID;
  String? _wifiIP;
  String? _wifiIPv6;
  String? _wifiSubmask;
  String? _wifiGatewayIP;
  String? _wifiBroadcast;

  String? get wifiName => _wifiName;
  String? get wifiBSSID => _wifiBSSID;
  String? get wifiIP => _wifiIP;
  String? get wifiIPv6 => _wifiIPv6;
  String? get wifiSubmask => _wifiSubmask;
  String? get wifiGatewayIP => _wifiGatewayIP;
  String? get wifiBroadcast => _wifiBroadcast;

  Future<void> init() async {
    return Future.wait([
      _networkInfo.getWifiName().then((value) => _wifiName = value),
      _networkInfo.getWifiBSSID().then((value) => _wifiBSSID = value),
      _networkInfo.getWifiIP().then((value) => _wifiIP = value),
      _networkInfo.getWifiIPv6().then((value) => _wifiIPv6 = value),
      _networkInfo.getWifiSubmask().then((value) => _wifiSubmask = value),
      _networkInfo.getWifiGatewayIP().then((value) => _wifiGatewayIP = value),
      _networkInfo.getWifiBroadcast().then((value) => _wifiBroadcast = value),
    ]).then((_) => notifyListeners());
  }
}
