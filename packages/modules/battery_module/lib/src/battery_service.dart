import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
import 'package:modular_service/modular_service.dart';

export 'package:battery_plus/battery_plus.dart' show BatteryState;

class BatteryService implements ModularService {
  Battery? _battery;
  BatteryState? _state;
  StreamController<BatteryState>? _controller;
  StreamSubscription<BatteryState>? _subscription;

  BatteryState? get state => _state;
  Stream<BatteryState> get onStateChanged {
    assert(_controller != null, 'Call BatteryService.init()');
    return _controller!.stream;
  }

  @override
  FutureOr<void> onInit() {
    _battery ??= Battery();
    _controller ??= StreamController<BatteryState>.broadcast();
    _subscription ??= _battery!.onBatteryStateChanged.listen((state) {
      _state = state;
      _controller?.add(state);
    });
  }

  @override
  Future<void> onDispose() async {
    await _subscription?.cancel();
    await _controller?.close();
  }
}
