import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageModel extends ChangeNotifier {
  LanguageModel();

  List<String>? _languages;

  List<String> get languages => _languages ??= [];
  List<Locale> get locales => AppLocalizations.supportedLocales;

  Future<void> init() async {
    _languages = await _loadLanguages();
    notifyListeners();
  }

  Future<List<String>> _loadLanguages() async {
    final languages = <String>[];
    for (final locale in locales) {
      languages.add(await _loadLanguage(locale));
    }
    return languages;
  }

  Future<String> _loadLanguage(Locale locale) async {
    final l10n = await AppLocalizations.delegate.load(locale);
    return l10n.locale;
  }
}
