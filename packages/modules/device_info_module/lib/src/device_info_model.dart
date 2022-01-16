import 'dart:async';

import 'package:flutter/foundation.dart';
import 'device_info_service.dart';

class DeviceInfoModel extends ChangeNotifier {
  DeviceInfoModel(this._service);

  final DeviceInfoService _service;
  Map<String, dynamic>? _info;

  Map<String, dynamic>? get deviceInfo => _info;

  Future<void> init() async {
    await _service.init();
    _info = await _service.getDeviceInfo();
    notifyListeners();
  }
}
