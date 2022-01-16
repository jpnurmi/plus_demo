import 'package:flutter/material.dart';
import 'package:plus_core/plus_core.dart';
import 'package:provider/provider.dart';

import 'l10n/device_localizations.dart';
import 'device_model.dart';
import 'device_service.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({Key? key}) : super(key: key);

  static Widget title(BuildContext context) {
    return Text(DeviceLocalizations.of(context).title);
  }

  static Widget body(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DeviceModel(getService<DeviceService>()),
      child: const DevicePage(),
    );
  }

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  @override
  void initState() {
    super.initState();
    context.read<DeviceModel>().init();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<DeviceModel>();
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ListView(
        children: model.device?.entries.map((entry) {
              return Card(
                child: ListTile(
                  title: Text(entry.value.toString()),
                  subtitle: Text(entry.key),
                ),
              );
            }).toList() ??
            [],
      ),
    );
  }
}
