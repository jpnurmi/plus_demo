import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'language_dialog.dart';
import 'language_model.dart';
import 'theme_dialog.dart';
import '../app.dart';

Future<void> showLanguageDialog(BuildContext context) async {
  final app = PlusApp.of(context);
  final locale = await showDialog<Locale>(
    context: context,
    builder: (BuildContext context) {
      return ChangeNotifierProvider(
        create: (_) => LanguageModel(),
        child: const LanguageDialog(),
      );
    },
  );
  if (locale != null) {
    app.locale.value = locale;
  }
}

Future<void> showThemeDialog(BuildContext context) async {
  final app = PlusApp.of(context);
  final themeMode = await showDialog<ThemeMode>(
    context: context,
    builder: (context) => ThemeDialog(themeMode: app.themeMode.value),
  );
  if (themeMode != null) {
    app.themeMode.value = themeMode;
  }
}
