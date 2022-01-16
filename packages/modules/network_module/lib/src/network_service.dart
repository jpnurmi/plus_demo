import 'dart:async';

import 'package:network_info_plus/network_info_plus.dart';
import 'package:plus_core/plus_core.dart';

abstract class NetworkService implements PlusService {
  factory NetworkService() => _NetworkPlusService();

  Future<String?> getIP();
  Future<String?> getName();
}

class _NetworkPlusService implements NetworkService {
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
