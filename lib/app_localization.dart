import 'package:easy_localization/easy_localization.dart';
import 'package:finalproject/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_material_app.dart';

class AppLocalization extends StatelessWidget {
  const AppLocalization({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      path: 'assets/locals',
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      startLocale: Provider.of<AppProvider>(context).appLocale,
      child: const MyMaterialApp(),
    );
  }
}
