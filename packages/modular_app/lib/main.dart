import 'package:battery_module/battery_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:language_module/language_module.dart';
import 'package:modular_module/modular_module.dart';
import 'package:network_module/network_module.dart';
import 'package:provider/provider.dart';

void main() {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  runApp(ModularApp(
    locale: binding.window.locale,
    modules: <ModularModule>[
      NetworkModule(),
      BatteryModule(),
      LanguageModule(),
    ],
  ));
}

class ModularApp extends StatelessWidget {
  ModularApp({
    Key? key,
    required Locale locale,
    required this.modules,
  })  : locale = ValueNotifier(locale),
        super(key: key);

  final ValueNotifier<Locale> locale;
  final Iterable<ModularModule> modules;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: locale,
      builder: (context, value, child) {
        return MaterialApp(
          locale: value,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: [
            ...AppLocalizations.localizationsDelegates,
            ...modules
                .where((module) => module.localizations != null)
                .map((module) => module.localizations!),
          ],
          onGenerateTitle: (context) => AppLocalizations.of(context).title,
          home: ChangeNotifierProvider.value(
            value: locale,
            child: ModularPage(modules: modules),
          ),
        );
      },
    );
  }
}

class ModularPage extends StatefulWidget {
  const ModularPage({Key? key, required this.modules}) : super(key: key);

  final Iterable<ModularModule> modules;

  @override
  State<ModularPage> createState() => _ModularPageState();
}

class _ModularPageState extends State<ModularPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.modules.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).title),
          bottom: TabBar(
            tabs: widget.modules.map((module) {
              return Tab(child: module.title(context));
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: widget.modules.map((module) {
            return module.body(context);
          }).toList(),
        ),
      ),
    );
  }
}
