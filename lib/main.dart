import 'package:easy_localization/easy_localization.dart';
import 'package:finalproject/providers/app_provider.dart';
import 'package:finalproject/providers/category_provider.dart';
import 'package:finalproject/providers/mail_filter_provider.dart';
import 'package:finalproject/providers/status_provider.dart';
import 'package:finalproject/providers/tags_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<MailFilterProvider>(
          create: (context) => MailFilterProvider()),
      ChangeNotifierProvider<AppProvider>(
        create: (context) => AppProvider(),
      ),
      ChangeNotifierProvider<StatusProvider>(
        create: (context) => StatusProvider(),
      ),
      ChangeNotifierProvider<CategoriesProvider>(
        create: (context) => CategoriesProvider(),
      ),
      ChangeNotifierProvider<TagProvider>(
        create: (context) => TagProvider(),
      )
    ], child: const AppLocalization());
  }
}
