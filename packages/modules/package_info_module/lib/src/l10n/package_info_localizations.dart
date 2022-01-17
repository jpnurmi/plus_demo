
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'package_info_localizations_en.dart';
import 'package_info_localizations_fi.dart';
import 'package_info_localizations_nb.dart';
import 'package_info_localizations_sv.dart';

/// Callers can lookup localized strings with an instance of PackageInfoLocalizations returned
/// by `PackageInfoLocalizations.of(context)`.
///
/// Applications need to include `PackageInfoLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'l10n/package_info_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: PackageInfoLocalizations.localizationsDelegates,
///   supportedLocales: PackageInfoLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the PackageInfoLocalizations.supportedLocales
/// property.
abstract class PackageInfoLocalizations {
  PackageInfoLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static PackageInfoLocalizations of(BuildContext context) {
    return Localizations.of<PackageInfoLocalizations>(context, PackageInfoLocalizations)!;
  }

  static const LocalizationsDelegate<PackageInfoLocalizations> delegate = _PackageInfoLocalizationsDelegate();

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
  /// **'Package Info +'**
  String get title;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'App'**
  String get appName;

  /// No description provided for @buildNumber.
  ///
  /// In en, this message translates to:
  /// **'Build'**
  String get buildNumber;

  /// No description provided for @buildSignature.
  ///
  /// In en, this message translates to:
  /// **'Signature'**
  String get buildSignature;

  /// No description provided for @packageName.
  ///
  /// In en, this message translates to:
  /// **'Package'**
  String get packageName;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;
}

class _PackageInfoLocalizationsDelegate extends LocalizationsDelegate<PackageInfoLocalizations> {
  const _PackageInfoLocalizationsDelegate();

  @override
  Future<PackageInfoLocalizations> load(Locale locale) {
    return SynchronousFuture<PackageInfoLocalizations>(lookupPackageInfoLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'fi', 'nb', 'sv'].contains(locale.languageCode);

  @override
  bool shouldReload(_PackageInfoLocalizationsDelegate old) => false;
}

PackageInfoLocalizations lookupPackageInfoLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return PackageInfoLocalizationsEn();
    case 'fi': return PackageInfoLocalizationsFi();
    case 'nb': return PackageInfoLocalizationsNb();
    case 'sv': return PackageInfoLocalizationsSv();
  }

  throw FlutterError(
    'PackageInfoLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
