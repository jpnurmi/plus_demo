import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import 'l10n/package_info_localizations.dart';

class PackageInfoPage extends StatelessWidget {
  const PackageInfoPage({Key? key}) : super(key: key);

  static Widget title(BuildContext context) {
    return Text(PackageInfoLocalizations.of(context).title);
  }

  static Widget body(BuildContext context) {
    return FutureProvider(
      initialData: PackageInfo(
        appName: '',
        packageName: '',
        version: '',
        buildNumber: '',
      ),
      create: (_) => PackageInfo.fromPlatform(),
      child: const PackageInfoPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final package = context.watch<PackageInfo>();
    final l10n = PackageInfoLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text(package.appName),
              subtitle: Text(l10n.appName),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(package.buildNumber),
              subtitle: Text(l10n.buildNumber),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(package.buildSignature),
              subtitle: Text(l10n.buildSignature),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(package.packageName),
              subtitle: Text(l10n.packageName),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(package.version),
              subtitle: Text(l10n.version),
            ),
          ),
        ],
      ),
    );
  }
}
