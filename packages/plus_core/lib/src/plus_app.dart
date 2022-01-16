import 'package:flutter/material.dart';

import 'plus_module.dart';

class PlusApp extends InheritedWidget {
  PlusApp({
    Key? key,
    required Locale locale,
    ThemeMode themeMode = ThemeMode.system,
    required this.modules,
    required Widget child,
  })  : locale = ValueNotifier(locale),
        themeMode = ValueNotifier(themeMode),
        super(key: key, child: child);

  final ValueNotifier<Locale> locale;
  final List<PlusModule> modules;
  final ValueNotifier<ThemeMode> themeMode;

  static PlusApp of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PlusApp>()!;
  }

  @override
  bool updateShouldNotify(covariant PlusApp oldWidget) {
    return locale != oldWidget.locale;
  }
}
