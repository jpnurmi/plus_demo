import 'package:flutter/material.dart';
import 'package:plus_core/plus_core.dart';
import 'package:provider/provider.dart';

import 'l10n/language_localizations.dart';
import 'language_model.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  static Widget title(BuildContext context) {
    return Text(LanguageLocalizations.of(context).title);
  }

  static Widget body(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LanguageModel(),
      child: const LanguagePage(),
    );
  }

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  void initState() {
    super.initState();
    context.read<LanguageModel>().init();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<LanguageModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kMinInteractiveDimension),
      child: ListView.builder(
        itemCount: model.languages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Center(child: Text(model.languages[index])),
            selected: model.locales[index] == Localizations.localeOf(context),
            onTap: () {
              final app = PlusApp.of(context);
              app.locale.value = model.locales[index];
            },
          );
        },
      ),
    );
  }
}
