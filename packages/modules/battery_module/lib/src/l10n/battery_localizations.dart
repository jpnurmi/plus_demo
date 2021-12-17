
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'battery_localizations_en.dart';
import 'battery_localizations_fi.dart';
import 'battery_localizations_nb.dart';
import 'battery_localizations_sv.dart';

/// Callers can lookup localized strings with an instance of BatteryLocalizations returned
/// by `BatteryLocalizations.of(context)`.
///
/// Applications need to include `BatteryLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'l10n/battery_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: BatteryLocalizations.localizationsDelegates,
///   supportedLocales: BatteryLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the BatteryLocalizations.supportedLocales
/// property.
abstract class BatteryLocalizations {
  BatteryLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static BatteryLocalizations of(BuildContext context) {
    return Localizations.of<BatteryLocalizations>(context, BatteryLocalizations)!;
  }

  static const LocalizationsDelegate<BatteryLocalizations> delegate = _BatteryLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fi'),
    Locale('nb'),
    Locale('sv')
  ];

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Battery'**
  String get title;

  /// No description provided for @charging.
  ///
  /// In en, this message translates to:
  /// **'Charging'**
  String get charging;

  /// No description provided for @discharging.
  ///
  /// In en, this message translates to:
  /// **'Discharging'**
  String get discharging;

  /// No description provided for @full.
  ///
  /// In en, this message translates to:
  /// **'Full'**
  String get full;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;
}

class _BatteryLocalizationsDelegate extends LocalizationsDelegate<BatteryLocalizations> {
  const _BatteryLocalizationsDelegate();

  @override
  Future<BatteryLocalizations> load(Locale locale) {
    return SynchronousFuture<BatteryLocalizations>(lookupBatteryLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'fi', 'nb', 'sv'].contains(locale.languageCode);

  @override
  bool shouldReload(_BatteryLocalizationsDelegate old) => false;
}

BatteryLocalizations lookupBatteryLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return BatteryLocalizationsEn();
    case 'fi': return BatteryLocalizationsFi();
    case 'nb': return BatteryLocalizationsNb();
    case 'sv': return BatteryLocalizationsSv();
  }

  throw FlutterError(
    'BatteryLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
