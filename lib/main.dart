import 'package:easy_localization/easy_localization.dart';
import 'package:finalproject/providers/app_provider_r.dart';
import 'package:finalproject/providers/category_provider_r.dart';
import 'package:finalproject/providers/mail_provider_r.dart';
import 'package:finalproject/providers/search_provider_r.dart';
import 'package:finalproject/providers/status_provider_r.dart';
import 'package:finalproject/providers/tags_provider_r.dart';
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
      ChangeNotifierProvider<AppProviderR>(
        create: (context) => AppProviderR(),
      ),
      ChangeNotifierProvider<StatusProviderR>(
        create: (context) => StatusProviderR(),
      ),
      ChangeNotifierProvider<CategoriesProviderR>(
        create: (context) => CategoriesProviderR(),
      ),
      ChangeNotifierProvider<TagProviderR>(
        create: (context) => TagProviderR(),
      ),
      ChangeNotifierProvider<SearchProviderR>(
        create: (context) => SearchProviderR(),
      ),
      ChangeNotifierProvider<MailProviderR>(
        create: (context) => MailProviderR(),
      ),
    ], child: const AppLocalization());
  }
}
