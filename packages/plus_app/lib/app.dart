import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:plus_core/plus_core.dart';
import 'package:yaru/yaru.dart';

import 'layout/layout.dart';
import 'settings/settings.dart';

class PlusApp extends InheritedWidget {
  PlusApp({
    Key? key,
    required Locale locale,
    ThemeMode themeMode = ThemeMode.system,
    required this.modules,
  })  : locale = ValueNotifier(locale),
        themeMode = ValueNotifier(themeMode),
        super(key: key, child: const PlusPage());

  final ValueNotifier<Locale> locale;
  final List<PlusModule> modules;
  final ValueNotifier<ThemeMode> themeMode;

  static PlusApp of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PlusApp>()!;
  }

  @override
  bool updateShouldNotify(covariant PlusApp oldWidget) {
    return locale != oldWidget.locale || themeMode != oldWidget.themeMode;
  }
}

class PlusPage extends StatelessWidget {
  const PlusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final app = PlusApp.of(context);
    return AnimatedBuilder(
      animation: Listenable.merge([app.locale, app.themeMode]),
      builder: (context, child) {
        return MaterialApp(
          locale: app.locale.value,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: [
            ...AppLocalizations.localizationsDelegates,
            ...app.modules
                .where((module) => module.localizations != null)
                .map((module) => module.localizations!),
          ],
          title: 'Plus Demo',
          theme: yaruLight,
          darkTheme: yaruDark,
          themeMode: app.themeMode.value,
          home: Builder(builder: (context) {
            return PlusLayout(
              modules: app.modules,
              actions: [
                PopupMenuButton<void Function(BuildContext)>(
                  onSelected: (showDialog) => showDialog.call(context),
                  itemBuilder: (context) {
                    final l10n = AppLocalizations.of(context);
                    return [
                      PopupMenuItem(
                        value: showLanguageDialog,
                        child: Text(l10n.language),
                      ),
                      PopupMenuItem(
                        value: showThemeDialog,
                        child: Text(l10n.theme),
                      ),
                    ];
                  },
                ),
              ],
            );
          }),
        );
      },
    );
  }
}
