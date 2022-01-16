import 'dart:async';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:plus_core/plus_core.dart';

abstract class DeviceService implements PlusService {
  factory DeviceService() => _DeviceInfoPlusService();

  Future<Map<String, dynamic>?> getDevice();
}

class _DeviceInfoPlusService implements DeviceService {
  DeviceInfoPlugin? _info;

  @override
  Future<Map<String, dynamic>?> getDevice() =>
      _info!.deviceInfo.then((v) => v.toMap());

  @override
  FutureOr<void> init() => _info ??= DeviceInfoPlugin();

  @override
  FutureOr<void> dispose() {}
}
