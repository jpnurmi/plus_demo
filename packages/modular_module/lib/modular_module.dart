library modular_module;

import 'package:flutter/material.dart';

abstract class ModularModule {
  WidgetBuilder get title;
  WidgetBuilder get body;
  LocalizationsDelegate? get localizations;
}

class ModularApp extends InheritedWidget {
  ModularApp({
    Key? key,
    required Locale locale,
    required this.modules,
    required Widget child,
  })  : locale = ValueNotifier(locale),
        super(key: key, child: child);

  final ValueNotifier<Locale> locale;
  final Iterable<ModularModule> modules;

  static ModularApp of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ModularApp>()!;
  }

  @override
  bool updateShouldNotify(covariant ModularApp oldWidget) {
    return locale != oldWidget.locale;
  }
}
