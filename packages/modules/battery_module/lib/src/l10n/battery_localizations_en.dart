


import 'battery_localizations.dart';

/// The translations for English (`en`).
class BatteryLocalizationsEn extends BatteryLocalizations {
  BatteryLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Battery';

  @override
  String get state => 'State';

  @override
  String get level => 'Level';

  @override
  String get charging => 'Charging';

  @override
  String get discharging => 'Discharging';

  @override
  String get full => 'Full';

  @override
  String get unknown => 'Unknown';
}
