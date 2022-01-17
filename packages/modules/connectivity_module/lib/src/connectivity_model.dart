import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

typedef ConnectivityState = ConnectivityResult;

class ConnectivityModel extends ChangeNotifier {
  ConnectivityModel(this._connectivity);

  final Connectivity _connectivity;
  StreamSubscription? _sub;
  ConnectivityState? _state;

  ConnectivityState? get state => _state;

  Future<void> init() {
    _sub = _connectivity.onConnectivityChanged.listen((state) {
      _state = state;
      notifyListeners();
    });
    return refresh();
  }

  Future<void> refresh() {
    return _connectivity.checkConnectivity().then((state) {
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
