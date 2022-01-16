import 'package:battery_module/battery_module.dart';
import 'package:connectivity_module/connectivity_module.dart';
import 'package:device_module/device_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:language_module/language_module.dart';
import 'package:modular_interface/modular_interface.dart';
import 'package:network_module/network_module.dart';
import 'package:theme_module/theme_module.dart';
import 'package:yaru/yaru.dart';

import 'layout/landscape.dart';
import 'layout/portrait.dart';

void main() {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  runApp(ModularApp(
    locale: binding.window.locale,
    modules: <ModularModule>[
      BatteryModule(),
      ConnectivityModule(),
      DeviceModule(),
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

class ModularLayout extends StatefulWidget {
  const ModularLayout({Key? key, required this.modules}) : super(key: key);

  final List<ModularModule> modules;

  @override
  State<ModularLayout> createState() => _ModularLayoutState();
}

class _ModularLayoutState extends State<ModularLayout> {
  var _index = -1;
  var _previousIndex = 0;

  void _setIndex(int index) {
    _previousIndex = _index;
    _index = index;
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        switch (orientation) {
          case Orientation.portrait:
            return PortraitLayout(
              index: _index,
              modules: widget.modules,
              onSelected: _setIndex,
            );
          case Orientation.landscape:
            return LandscapeLayout(
              index: _index == -1 ? _previousIndex : _index,
              modules: widget.modules,
              onSelected: _setIndex,
            );
        }
      },
    );
  }
}
