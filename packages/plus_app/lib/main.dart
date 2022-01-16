import 'package:battery_module/battery_module.dart';
import 'package:connectivity_module/connectivity_module.dart';
import 'package:device_info_module/device_info_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:language_module/language_module.dart';
import 'package:network_module/network_module.dart';
import 'package:plus_core/plus_core.dart';
import 'package:theme_module/theme_module.dart';
import 'package:yaru/yaru.dart';

import 'layout/layout.dart';

void main() {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  runApp(PlusApp(
    locale: binding.window.locale,
    modules: <PlusModule>[
      BatteryModule(),
      ConnectivityModule(),
      DeviceInfoModule(),
      LanguageModule(),
      NetworkModule(),
      ThemeModule(),
    ],
    child: const PlusPage(),
  ));
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
          onGenerateTitle: (context) => AppLocalizations.of(context).title,
          theme: yaruLight,
          darkTheme: yaruDark,
          themeMode: app.themeMode.value,
          home: PlusLayout(modules: app.modules),
        );
      },
    );
  }
}
