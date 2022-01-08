library modular_service;

import 'dart:async';

import 'package:get_it/get_it.dart';

T getService<T extends ModularService>() => GetIt.I<T>();

void registerService<T extends ModularService>(T Function() create) {
  GetIt.I.registerFactory<T>(() => create());
}

abstract class ModularService implements Disposable {
  FutureOr<void> onInit();
}
