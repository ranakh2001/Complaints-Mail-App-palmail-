import 'package:finalproject/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      // locale: context.locale,
      title: 'PalMail',
      theme: ThemeData(
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
      home: const HomePage(),
    );
  }
}
