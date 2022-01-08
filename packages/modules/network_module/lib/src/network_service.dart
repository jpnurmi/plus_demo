import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:modular_service/modular_service.dart';

typedef NetworkState = ConnectivityResult;

class NetworkService implements ModularService {
  Connectivity? _connectivity;
  NetworkState? _state;
  StreamController<NetworkState>? _controller;
  StreamSubscription<NetworkState>? _subscription;

  NetworkState? get state => _state;
  Stream<NetworkState> get onStateChanged {
    assert(_controller != null, 'Call NetworkService.init()');
    return _controller!.stream;
  }

  @override
  FutureOr<void> onInit() {
    _connectivity ??= Connectivity();
    _controller ??= StreamController<NetworkState>.broadcast();
    _subscription ??= _connectivity!.onConnectivityChanged.listen((state) {
      _state = state;
      _controller?.add(state);
    });
  }

  @override
  Future<void> onDispose() async {
    await _subscription?.cancel();
    await _controller?.close();
  }
}
