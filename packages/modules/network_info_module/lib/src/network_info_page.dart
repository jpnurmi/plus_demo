import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:plus_core/plus_core.dart';
import 'package:provider/provider.dart';

import 'l10n/network_info_localizations.dart';
import 'network_info_model.dart';

class NetworkInfoPage extends StatefulWidget {
  const NetworkInfoPage({Key? key}) : super(key: key);

  static Widget title(BuildContext context) {
    return Text(NetworkInfoLocalizations.of(context).title);
  }

  static Widget body(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NetworkInfoModel(getPlugin<NetworkInfo>()),
      child: const NetworkInfoPage(),
    );
  }

  @override
  State<NetworkInfoPage> createState() => _NetworkInfoPageState();
}

class _NetworkInfoPageState extends State<NetworkInfoPage> {
  @override
  void initState() {
    super.initState();
    context.read<NetworkInfoModel>().init();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NetworkInfoModel>();
    final l10n = NetworkInfoLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text(model.wifiName ?? ''),
              subtitle: Text(l10n.name),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(model.wifiBSSID ?? ''),
              subtitle: Text(l10n.bssid),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(model.wifiIP ?? ''),
              subtitle: Text(l10n.ipv4),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(model.wifiIPv6 ?? ''),
              subtitle: Text(l10n.ipv6),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(model.wifiSubmask ?? ''),
              subtitle: Text(l10n.subnet),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(model.wifiGatewayIP ?? ''),
              subtitle: Text(l10n.gateway),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(model.wifiBroadcast ?? ''),
              subtitle: Text(l10n.broadcast),
            ),
          ),
        ],
      ),
    );
  }
}
