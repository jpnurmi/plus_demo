import 'dart:async';

import 'package:flutter/foundation.dart';
import 'network_service.dart';

class NetworkModel extends ChangeNotifier {
  NetworkModel(this._service);

  final NetworkService _service;
  StreamSubscription? _sub;

  NetworkState? get state => _service.state;

  Future<void> init() async {
    await _service.onInit();
    _sub = _service.onStateChanged.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
