import 'package:flutter/material.dart';
import 'package:modular_interface/modular_interface.dart';

import 'l10n/theme_localizations.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({Key? key}) : super(key: key);

  static Widget title(BuildContext context) {
    return Text(ThemeLocalizations.of(context).title);
  }

  static Widget body(BuildContext context) => const ThemePage();

  @override
  Widget build(BuildContext context) {
    final app = ModularApp.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kMinInteractiveDimension),
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: app.themeMode,
        builder: (context, value, child) {
          return ListView(
            children: ThemeMode.values.map((themeMode) {
              return ListTile(
                title: Center(child: Text(themeMode.l10n(context))),
                selected: app.themeMode.value == themeMode,
                onTap: () => app.themeMode.value = themeMode,
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

extension ThemeModeL10n on ThemeMode {
  String l10n(BuildContext context) {
    switch (this) {
      case ThemeMode.system:
        return ThemeLocalizations.of(context).system;
      case ThemeMode.light:
        return ThemeLocalizations.of(context).light;
      case ThemeMode.dark:
        return ThemeLocalizations.of(context).dark;
    }
  }
}
