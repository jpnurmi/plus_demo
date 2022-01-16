import 'package:battery_module/battery_module.dart';
import 'package:connectivity_module/connectivity_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:language_module/language_module.dart';
import 'package:modular_module/modular_module.dart';
import 'package:network_module/network_module.dart';
import 'package:theme_module/theme_module.dart';
import 'package:yaru/yaru.dart';

void main() {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  runApp(ModularApp(
    locale: binding.window.locale,
    modules: <ModularModule>[
      BatteryModule(),
      ConnectivityModule(),
      LanguageModule(),
      NetworkModule(),
      ThemeModule(),
    ],
    child: const ModularPage(),
  ));
}

class ModularPage extends StatelessWidget {
  const ModularPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final app = ModularApp.of(context);
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
          home: ModularLayout(modules: app.modules),
        );
      },
    );
  }
}

class ModularLayout extends StatelessWidget {
  const ModularLayout({Key? key, required this.modules}) : super(key: key);

  final Iterable<ModularModule> modules;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: modules.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).title),
          bottom: TabBar(
            tabs: modules.map((module) {
              return Tab(child: module.title(context));
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: modules.map((module) {
            return module.body(context);
          }).toList(),
        ),
      ),
    );
  }
}
