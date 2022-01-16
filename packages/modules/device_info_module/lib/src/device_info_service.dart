import 'dart:async';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:plus_core/plus_core.dart';

abstract class DeviceInfoService implements PlusService {
  factory DeviceInfoService() => _DeviceInfoPlusService();

  Future<Map<String, dynamic>?> getDeviceInfo();
}

class _DeviceInfoPlusService implements DeviceInfoService {
  DeviceInfoPlugin? _info;

  @override
  Future<Map<String, dynamic>?> getDeviceInfo() {
    return _info!.deviceInfo.then((v) => v.toMap());
  }

  @override
  FutureOr<void> init() => _info ??= DeviceInfoPlugin();

  @override
  FutureOr<void> dispose() {}
}
