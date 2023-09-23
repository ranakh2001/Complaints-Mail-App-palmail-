import 'package:finalproject/providers/mail_filter_provider.dart';
import 'package:finalproject/screens/admin/admin-users_screen.dart';
import 'package:finalproject/screens/guest/guest-screen.dart';
import 'package:finalproject/screens/home/home_page.dart';
import 'package:finalproject/screens/loading_screen.dart';
import 'package:finalproject/screens/search/search_screen.dart';
import 'package:finalproject/screens/auth/login_screen.dart';
import 'package:finalproject/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MailFilterProvider>(
            create: (context) => MailFilterProvider())
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
        initialRoute: AdminUsersScreen.id,
        routes: {
          LoadingScreen.id: (context) => const LoadingScreen(),
          MailDetailsScreen.id: (context) => const MailDetailsScreen(),
          HomePage.id: (context) => const HomePage(),
          AdminUsersScreen.id: (context) =>  AdminUsersScreen(users: [],),
          SearchScreen.id: (context) => const SearchScreen(),
          GuestScreen.id: (context) =>  const GuestScreen(),
          LoginScreen.id: (context) =>  const LoginScreen(),
          SplashScreen.id: (context) =>  const SplashScreen(),
        },
      ),
    );
  }
}
