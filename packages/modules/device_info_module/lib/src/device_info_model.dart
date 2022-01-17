import 'dart:async';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

class DeviceInfoModel extends ChangeNotifier {
  DeviceInfoModel(this._deviceInfo);

  final DeviceInfoPlugin _deviceInfo;
  Map<String, dynamic>? _value;

  Map<String, dynamic>? get deviceInfo => _value;

  Future<void> init() async {
    _value = await _deviceInfo.deviceInfo.then((value) => value.toMap());
    notifyListeners();
  }
}
