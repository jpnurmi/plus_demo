


import 'network_info_localizations.dart';

/// The translations for English (`en`).
class NetworkInfoLocalizationsEn extends NetworkInfoLocalizations {
  NetworkInfoLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Network Info +';

  @override
  String get online => 'Online';

  @override
  String get offline => 'Offline';

  @override
  String get name => 'Name';

  @override
  String get bssid => 'BSSID';

  @override
  String get ipv4 => 'IPv4';

  @override
  String get ipv6 => 'IPv6';

  @override
  String get subnet => 'Subnet';

  @override
  String get gateway => 'Gateway';

  @override
  String get broadcast => 'Broadcast';
}
