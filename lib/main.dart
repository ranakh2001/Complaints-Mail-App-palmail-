
import 'package:finalproject/screens/admin-users_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:finalproject/pages/new_inbox_view.dart';
import 'package:finalproject/screens/guest-screen.dart';
import 'package:finalproject/screens/login_screen.dart';
import 'package:finalproject/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main()  {
  // WidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();
  runApp(
      const MyApp()
      // EasyLocalization(
      // path: 'assets/translation',
      // supportedLocales: const [Locale('en'), Locale('ar')],
      // fallbackLocale: const Locale('en'),
      // child: )
       );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:NewInboxView(),
      debugShowCheckedModeBanner: false,
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      // locale: context.locale,
      title: 'PalMail',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
//       initialRoute: '/splash_screen',
      routes: {
        '/splash_screen': (context) => const SplashScreen(),
        '/login_screen': (context) => const LoginScreen(),
      },
    );
  }
}
