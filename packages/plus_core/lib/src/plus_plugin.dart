import 'package:get_it/get_it.dart';

T getPlugin<T extends Object>() => GetIt.I<T>();

void registerPlugin<T extends Object>(T Function() create) {
  GetIt.I.registerFactory<T>(create);
}
