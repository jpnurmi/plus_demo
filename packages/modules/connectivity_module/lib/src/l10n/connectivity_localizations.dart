
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'connectivity_localizations_en.dart';
import 'connectivity_localizations_fi.dart';
import 'connectivity_localizations_nb.dart';
import 'connectivity_localizations_sv.dart';

/// Callers can lookup localized strings with an instance of ConnectivityLocalizations returned
/// by `ConnectivityLocalizations.of(context)`.
///
/// Applications need to include `ConnectivityLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'l10n/connectivity_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: ConnectivityLocalizations.localizationsDelegates,
///   supportedLocales: ConnectivityLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the ConnectivityLocalizations.supportedLocales
/// property.
abstract class ConnectivityLocalizations {
  ConnectivityLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ConnectivityLocalizations of(BuildContext context) {
    return Localizations.of<ConnectivityLocalizations>(context, ConnectivityLocalizations)!;
  }

  static const LocalizationsDelegate<ConnectivityLocalizations> delegate = _ConnectivityLocalizationsDelegate();

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
  /// **'Connectivity +'**
  String get title;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// No description provided for @online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get online;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;
}

class _ConnectivityLocalizationsDelegate extends LocalizationsDelegate<ConnectivityLocalizations> {
  const _ConnectivityLocalizationsDelegate();

  @override
  Future<ConnectivityLocalizations> load(Locale locale) {
    return SynchronousFuture<ConnectivityLocalizations>(lookupConnectivityLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'fi', 'nb', 'sv'].contains(locale.languageCode);

  @override
  bool shouldReload(_ConnectivityLocalizationsDelegate old) => false;
}

ConnectivityLocalizations lookupConnectivityLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return ConnectivityLocalizationsEn();
    case 'fi': return ConnectivityLocalizationsFi();
    case 'nb': return ConnectivityLocalizationsNb();
    case 'sv': return ConnectivityLocalizationsSv();
  }

  throw FlutterError(
    'ConnectivityLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
