import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:battery_plus/battery_plus.dart';

class BatteryModel extends ChangeNotifier {
  BatteryModel(this._battery);

  final Battery _battery;
  StreamSubscription? _sub;
  int? _level;
  BatteryState? _state;

  int? get level => _level;
  BatteryState? get state => _state;

  Future<void> init() {
    _sub = _battery.onBatteryStateChanged.listen((state) {
      _state = state;
      notifyListeners();
    });
    return refresh();
  }

  Future<void> refresh() {
    return Future.wait([
      _battery.batteryLevel.then((level) => _level = level),
      _battery.batteryState.then((state) => _state = state),
    ]).then((_) => notifyListeners());
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
