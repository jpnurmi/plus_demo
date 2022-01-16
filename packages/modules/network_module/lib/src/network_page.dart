import 'package:flutter/material.dart';
import 'package:plus_core/plus_core.dart';
import 'package:provider/provider.dart';

import 'l10n/network_localizations.dart';
import 'network_model.dart';
import 'network_service.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({Key? key}) : super(key: key);

  static Widget title(BuildContext context) {
    return Text(NetworkLocalizations.of(context).title);
  }

  static Widget body(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NetworkModel(getService<NetworkService>()),
      child: const NetworkPage(),
    );
  }

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  @override
  void initState() {
    super.initState();
    context.read<NetworkModel>().init();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NetworkModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kMinInteractiveDimension),
      child: Column(
        children: [
          ListTile(title: Center(child: Text('Name: ${model.name}'))),
          ListTile(title: Center(child: Text('IP: ${model.ip}'))),
        ],
      ),
    );
  }
}
