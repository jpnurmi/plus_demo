import 'dart:async';

import 'package:get_it/get_it.dart';

T getService<T extends PlusService>() => GetIt.I<T>();

void registerService<T extends PlusService>(T Function() create) {
  GetIt.I.registerLazySingleton<T>(
    () => create(),
    dispose: (service) => service.dispose(),
  );
}

abstract class PlusService {
  FutureOr<void> init();
  FutureOr<void> dispose();
}
