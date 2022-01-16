import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
import 'package:plus_core/plus_core.dart';

export 'package:battery_plus/battery_plus.dart' show BatteryState;

abstract class BatteryService implements PlusService {
  factory BatteryService() => _BatteryPlusService();

  Future<int> get level;
  Future<BatteryState> get state;
  Stream<BatteryState> get onStateChanged;
}

class _BatteryPlusService implements BatteryService {
  Battery? _battery;
  StreamController<BatteryState>? _controller;
  StreamSubscription<BatteryState>? _subscription;

  @override
  Future<int> get level => _battery!.batteryLevel;

  @override
  Future<BatteryState> get state => _battery!.batteryState;

  @override
  Stream<BatteryState> get onStateChanged {
    _controller ??= StreamController<BatteryState>.broadcast();
    return _controller!.stream;
  }

  @override
  FutureOr<void> init() {
    _battery ??= Battery();
    _subscription ??= _battery!.onBatteryStateChanged.listen((state) {
      _controller?.add(state);
    });
  }

  @override
  Future<void> dispose() async {
    await _subscription?.cancel();
    await _controller?.close();
  }
}
