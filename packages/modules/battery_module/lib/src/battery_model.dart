import 'dart:async';

import 'package:flutter/foundation.dart';

import 'battery_service.dart';

class BatteryModel extends ChangeNotifier {
  BatteryModel(this._service);

  final BatteryService _service;
  StreamSubscription? _sub;
  int? _level;
  BatteryState? _state;

  int? get level => _level;
  BatteryState? get state => _state;

  Future<void> init() async {
    await _service.init();
    _sub = _service.onStateChanged.listen((_) => notifyListeners());
    return refresh();
  }

  Future<void> refresh() {
    return Future.wait([
      _service.level.then((level) => _level = level),
      _service.state.then((state) => _state = state),
    ]).then((_) => notifyListeners());
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
