import 'dart:async';

import 'package:network_info_plus/network_info_plus.dart';
import 'package:flutter/foundation.dart';

class NetworkInfoModel extends ChangeNotifier {
  NetworkInfoModel(this._networkInfo);

  final NetworkInfo _networkInfo;
  String? _wifiIP;
  String? _wifiName;

  String? get wifiIP => _wifiIP;
  String? get wifiName => _wifiName;

  Future<void> init() async {
    return Future.wait([
      _networkInfo.getWifiIP().then((value) => _wifiIP = value),
      _networkInfo.getWifiName().then((value) => _wifiName = value),
    ]).then((_) => notifyListeners());
  }
}
