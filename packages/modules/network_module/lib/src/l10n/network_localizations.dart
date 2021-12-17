
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'network_localizations_en.dart';
import 'network_localizations_fi.dart';
import 'network_localizations_nb.dart';
import 'network_localizations_sv.dart';

/// Callers can lookup localized strings with an instance of NetworkLocalizations returned
/// by `NetworkLocalizations.of(context)`.
///
/// Applications need to include `NetworkLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'l10n/network_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: NetworkLocalizations.localizationsDelegates,
///   supportedLocales: NetworkLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the NetworkLocalizations.supportedLocales
/// property.
abstract class NetworkLocalizations {
  NetworkLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static NetworkLocalizations of(BuildContext context) {
    return Localizations.of<NetworkLocalizations>(context, NetworkLocalizations)!;
  }

  static const LocalizationsDelegate<NetworkLocalizations> delegate = _NetworkLocalizationsDelegate();

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
  /// **'Network'**
  String get title;

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

class _NetworkLocalizationsDelegate extends LocalizationsDelegate<NetworkLocalizations> {
  const _NetworkLocalizationsDelegate();

  @override
  Future<NetworkLocalizations> load(Locale locale) {
    return SynchronousFuture<NetworkLocalizations>(lookupNetworkLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'fi', 'nb', 'sv'].contains(locale.languageCode);

  @override
  bool shouldReload(_NetworkLocalizationsDelegate old) => false;
}

NetworkLocalizations lookupNetworkLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return NetworkLocalizationsEn();
    case 'fi': return NetworkLocalizationsFi();
    case 'nb': return NetworkLocalizationsNb();
    case 'sv': return NetworkLocalizationsSv();
  }

  throw FlutterError(
    'NetworkLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
