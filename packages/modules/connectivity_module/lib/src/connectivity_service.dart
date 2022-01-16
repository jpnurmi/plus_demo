import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:plus_core/plus_core.dart';

typedef ConnectivityState = ConnectivityResult;

abstract class ConnectivityService implements PlusService {
  factory ConnectivityService() => _ConnectivityPlusService();

  ConnectivityState? get state;
  Stream<ConnectivityState> get onStateChanged;
}

class _ConnectivityPlusService implements ConnectivityService {
  Connectivity? _connectivity;
  ConnectivityState? _state;
  StreamController<ConnectivityState>? _controller;
  StreamSubscription<ConnectivityState>? _subscription;

  @override
  ConnectivityState? get state => _state;

  @override
  Stream<ConnectivityState> get onStateChanged {
    assert(_controller != null, 'Call ConnectivityService.init()');
    return _controller!.stream;
  }

  @override
  FutureOr<void> init() {
    _connectivity ??= Connectivity();
    _controller ??= StreamController<ConnectivityState>.broadcast();
    _subscription ??= _connectivity!.onConnectivityChanged.listen((state) {
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
