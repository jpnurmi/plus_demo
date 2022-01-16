import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'language_model.dart';

class LanguageDialog extends StatefulWidget {
  const LanguageDialog({Key? key}) : super(key: key);

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LanguageModel(),
      child: const LanguageDialog(),
    );
  }

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  @override
  void initState() {
    super.initState();
    context.read<LanguageModel>().init();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<LanguageModel>();
    final l10n = AppLocalizations.of(context);
    return AlertDialog(
      title: Text(l10n.language),
      scrollable: true,
      contentPadding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
      content: Column(
        children: [
          for (var i = 0; i < model.languages.length; ++i)
            ListTile(
              title: Text(model.languages[i]),
              selected: model.locales[i] == Localizations.localeOf(context),
              contentPadding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              onTap: () => Navigator.of(context).pop(model.locales[i]),
            ),
        ],
      ),
    );
  }
}
