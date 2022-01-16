import 'dart:async';

import 'package:flutter/foundation.dart';
import 'connectivity_service.dart';

class ConnectivityModel extends ChangeNotifier {
  ConnectivityModel(this._service);

  final ConnectivityService _service;
  StreamSubscription? _sub;

  ConnectivityState? get state => _service.state;

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
