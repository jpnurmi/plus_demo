import 'dart:async';

import 'package:flutter/foundation.dart';
import 'device_service.dart';

class DeviceModel extends ChangeNotifier {
  DeviceModel(this._service);

  final DeviceService _service;
  Map<String, dynamic>? _device;

  Map<String, dynamic>? get device => _device;

  Future<void> init() async {
    await _service.init();
    _device = await _service.getDevice();
    notifyListeners();
  }
}
