import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:plus_core/plus_core.dart';

typedef ConnectivityState = ConnectivityResult;

abstract class ConnectivityService implements PlusService {
  factory ConnectivityService() => _ConnectivityPlusService();

  Future<ConnectivityState> get state;
  Stream<ConnectivityState> get onStateChanged;
}

class _ConnectivityPlusService implements ConnectivityService {
  Connectivity? _connectivity;
  StreamController<ConnectivityState>? _controller;
  StreamSubscription<ConnectivityState>? _subscription;

  @override
  Future<ConnectivityState> get state => _connectivity!.checkConnectivity();

  @override
  Stream<ConnectivityState> get onStateChanged {
    _controller ??= StreamController<ConnectivityState>.broadcast();
    return _controller!.stream;
  }

  @override
  FutureOr<void> init() {
    _connectivity ??= Connectivity();
    _subscription ??= _connectivity!.onConnectivityChanged.listen((state) {
      _controller?.add(state);
    });
  }

  @override
  Future<void> dispose() async {
    await _subscription?.cancel();
    await _controller?.close();
  }
}
