import 'dart:async';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:modular_interface/modular_interface.dart';

abstract class DeviceService implements ModularService {
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
