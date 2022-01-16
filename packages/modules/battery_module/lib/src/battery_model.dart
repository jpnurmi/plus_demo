import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:modular_interface/modular_interface.dart';
import 'battery_service.dart';

class BatteryModel extends ChangeNotifier {
  BatteryModel(this._service);

  final BatteryService _service;
  StreamSubscription? _sub;

  BatteryState? get state => _service.state;

  Future<void> init() async {
    await _service.init();
    _sub = _service.onStateChanged.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
