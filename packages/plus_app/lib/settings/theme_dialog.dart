import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeDialog extends StatelessWidget {
  const ThemeDialog({
    Key? key,
    required this.themeMode,
  }) : super(key: key);

  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return AlertDialog(
      title: Text(l10n.theme),
      scrollable: true,
      contentPadding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
      content: Column(
        children: ThemeMode.values.map((value) {
          return ListTile(
            title: Text(value.l10n(context)),
            contentPadding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            selected: value == themeMode,
            onTap: () => Navigator.of(context).pop(value),
          );
        }).toList(),
      ),
    );
  }
}

extension ThemeModeL10n on ThemeMode {
  String l10n(BuildContext context) {
    switch (this) {
      case ThemeMode.system:
        return AppLocalizations.of(context).system;
      case ThemeMode.light:
        return AppLocalizations.of(context).light;
      case ThemeMode.dark:
        return AppLocalizations.of(context).dark;
    }
  }
}
