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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kMinInteractiveDimension),
      child: Column(
        children: [
          ListTile(title: Center(child: Text('Name: ${model.wifiName}'))),
          ListTile(title: Center(child: Text('IP: ${model.wifiIP}'))),
        ],
      ),
    );
  }
}
