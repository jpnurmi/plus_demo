import 'dart:async';

import 'package:flutter/foundation.dart';
import 'connectivity_service.dart';

class ConnectivityModel extends ChangeNotifier {
  ConnectivityModel(this._service);

  final ConnectivityService _service;
  StreamSubscription? _sub;
  ConnectivityState? _state;

  ConnectivityState? get state => _state;

  Future<void> init() async {
    await _service.init();
    _sub = _service.onStateChanged.listen((_) => notifyListeners());
    return refresh();
  }

  Future<void> refresh() {
    return _service.state.then((state) {
      _state = state;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
