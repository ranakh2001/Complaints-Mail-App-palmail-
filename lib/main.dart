import 'package:finalproject/providers/date_archive.dart';
import 'package:finalproject/providers/mail_filter_provider.dart';
import 'package:finalproject/providers/new_inbox_provider.dart';
import 'package:finalproject/providers/sender_search_provider.dart';
import 'package:finalproject/providers/status_provider.dart';
import 'package:finalproject/providers/tag_provider.dart';
import 'package:finalproject/screens/new%20inbox/categories_view.dart';
import 'package:finalproject/screens/new%20inbox/items.dart';
import 'package:finalproject/screens/new%20inbox/new_inbox_view.dart';
import 'package:finalproject/screens/new%20inbox/status_view.dart';
import 'package:finalproject/screens/new%20inbox/tag_view.dart';
import 'package:finalproject/screens/search/search_screen.dart';
import 'package:finalproject/screens/auth/login_screen.dart';
import 'package:finalproject/screens/splash/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'providers/category_notifier.dart';
import 'screens/home/mail_details_screen.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();
  runApp(const MyApp()
      // EasyLocalization(
      // path: 'assets/translation',
      // supportedLocales: const [Locale('en'), Locale('ar')],
      // fallbackLocale: const Locale('en'),
      // child: )
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<MailFilterProvider>(
              create: (context) => MailFilterProvider()),
          ChangeNotifierProvider<CategoryProvider>(
              create: (context) => CategoryProvider()),
          ChangeNotifierProvider<NewInboxProvider>(
              create: (context) => NewInboxProvider()),
          ChangeNotifierProvider<SenderSearchProvider>(
              create: (context) => SenderSearchProvider()),
          ChangeNotifierProvider<StatusProvider>(
              create: (context) => StatusProvider()),
          ChangeNotifierProvider<TagStateNotifier>(
              create: (context) => TagStateNotifier()),
          ChangeNotifierProvider<DateArchiveProvider>(
              create: (context) => DateArchiveProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // localizationsDelegates: context.localizationDelegates,
          // supportedLocales: context.supportedLocales,
          // locale: context.locale,
          title: 'PalMail',
          theme: ThemeData(
            fontFamily: 'Poppins',
            iconTheme: const IconThemeData(color: Color(0xffB2B2B2)),
            textTheme: TextTheme(
                bodySmall: GoogleFonts.poppins(
                    color: const Color(0xffB2B2B2), fontSize: 12),
                bodyMedium: GoogleFonts.poppins(
                    color: const Color(0xff272727), fontSize: 18)),
            appBarTheme: const AppBarTheme(backgroundColor: Color(0xffF7F6FF)),
            scaffoldBackgroundColor: const Color(0xffF7F6FF),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            // useMaterial3: true,
          ),
          home: Scaffold(body: NewInboxView()),
          routes: {
            MailDetailsScreen.id: (context) => const MailDetailsScreen(),
            SearchScreen.id: (context) => const SearchScreen(),
            '/splash_screen': (context) => const SplashScreen(),
            '/login_screen': (context) => const LoginScreen(),
          },
        ));
  }
}
