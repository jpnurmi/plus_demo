import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
import 'package:plus_core/plus_core.dart';

export 'package:battery_plus/battery_plus.dart' show BatteryState;

abstract class BatteryService implements PlusService {
  factory BatteryService() => _BatteryPlusService();

  BatteryState? get state;
  Stream<BatteryState> get onStateChanged;
}

class _BatteryPlusService implements BatteryService {
  Battery? _battery;
  BatteryState? _state;
  StreamController<BatteryState>? _controller;
  StreamSubscription<BatteryState>? _subscription;

  @override
  BatteryState? get state => _state;

  @override
  Stream<BatteryState> get onStateChanged {
    assert(_controller != null, 'Call BatteryService.init()');
    return _controller!.stream;
  }

  @override
  FutureOr<void> init() {
    _battery ??= Battery();
    _controller ??= StreamController<BatteryState>.broadcast();
    _subscription ??= _battery!.onBatteryStateChanged.listen((state) {
      _state = state;
      _controller?.add(state);
    });
  }

  @override
  Future<void> dispose() async {
    await _subscription?.cancel();
    await _controller?.close();
  }
}
