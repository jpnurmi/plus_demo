import 'dart:async';

import 'package:network_info_plus/network_info_plus.dart';
import 'package:plus_core/plus_core.dart';

abstract class NetworkInfoService implements PlusService {
  factory NetworkInfoService() => _NetworkPlusService();

  Future<String?> getIP();
  Future<String?> getName();
}

class _NetworkPlusService implements NetworkInfoService {
  NetworkInfo? _info;

  @override
  Future<String?> getIP() => _info!.getWifiIP();

  @override
  Future<String?> getName() => _info!.getWifiName();

  @override
  FutureOr<void> init() => _info ??= NetworkInfo();

  @override
  FutureOr<void> dispose() {}
}
