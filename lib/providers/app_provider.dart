import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  Locale appLocale = const Locale('en');

  void changeLanguage() {
    if (appLocale == const Locale('en')) {
      appLocale = const Locale('ar');
    } else {
      appLocale = const Locale('en');
    }
    notifyListeners();
  }
}
