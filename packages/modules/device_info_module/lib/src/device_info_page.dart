import 'package:flutter/material.dart';
import 'package:plus_core/plus_core.dart';
import 'package:provider/provider.dart';

import 'l10n/device_info_localizations.dart';
import 'device_info_model.dart';
import 'device_info_service.dart';

class DeviceInfoPage extends StatefulWidget {
  const DeviceInfoPage({Key? key}) : super(key: key);

  static Widget title(BuildContext context) {
    return Text(DeviceInfoLocalizations.of(context).title);
  }

  static Widget body(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DeviceInfoModel(getService<DeviceInfoService>()),
      child: const DeviceInfoPage(),
    );
  }

  @override
  State<DeviceInfoPage> createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  @override
  void initState() {
    super.initState();
    context.read<DeviceInfoModel>().init();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<DeviceInfoModel>();
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ListView(
        children: model.deviceInfo?.entries.map((entry) {
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
