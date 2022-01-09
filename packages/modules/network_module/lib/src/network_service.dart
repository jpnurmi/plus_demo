import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:modular_service/modular_service.dart';

typedef NetworkState = ConnectivityResult;

abstract class NetworkService implements ModularService {
  factory NetworkService() => _NetworkPlusService();

  NetworkState? get state;
  Stream<NetworkState> get onStateChanged;
}

class _NetworkPlusService implements NetworkService {
  Connectivity? _connectivity;
  NetworkState? _state;
  StreamController<NetworkState>? _controller;
  StreamSubscription<NetworkState>? _subscription;

  @override
  NetworkState? get state => _state;

  @override
  Stream<NetworkState> get onStateChanged {
    assert(_controller != null, 'Call NetworkService.init()');
    return _controller!.stream;
  }

  @override
  FutureOr<void> init() {
    _connectivity ??= Connectivity();
    _controller ??= StreamController<NetworkState>.broadcast();
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
