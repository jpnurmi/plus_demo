import 'dart:async';

import 'package:get_it/get_it.dart';

T getService<T extends ModularService>() => GetIt.I<T>();

void registerService<T extends ModularService>(T Function() create) {
  GetIt.I.registerLazySingleton<T>(
    () => create(),
    dispose: (service) => service.dispose(),
  );
}

abstract class ModularService {
  FutureOr<void> init();
  FutureOr<void> dispose();
}
