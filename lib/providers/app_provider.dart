import 'package:finalproject/models/dreawer_item.dart';
import 'package:finalproject/screens/home/home_view.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  double xoffset = 0;
  double yoffset = 0;
  double scaleFactor = 1;
  bool isOpen = false;
  Locale appLocale = const Locale('en');
  int selectedItem = 0;

  List<DrawerMenueItem> drawerItems = [
    DrawerMenueItem(
      title: "Home",
      itemView: const HomePageView(),
    ),
    DrawerMenueItem(title: "Profile", itemView: const Placeholder()),
    DrawerMenueItem(title: "Users", itemView: const Placeholder()),
    DrawerMenueItem(title: "Change Language", itemView: const Placeholder()),
    DrawerMenueItem(title: "Logout", itemView: const Placeholder())
  ];

  void changeLanguage() {
    if (appLocale == const Locale('en')) {
      appLocale = const Locale('ar');
    } else {
      appLocale = const Locale('en');
    }
    notifyListeners();
  }

  openDrawer() {
    if (isOpen) {
      xoffset = 0;
      yoffset = 0;
      scaleFactor = 1;
      isOpen = false;
    } else {
      xoffset = 240;
      yoffset = 120;
      scaleFactor = 0.7;
      isOpen = true;
    }
    notifyListeners();
  }

  changeView(int index) {
    drawerItems[index].isSelected = true;
    if (drawerItems[index].isSelected) {
      drawerItems[index].style = const TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
      selectedItem = index;
    }
    notifyListeners();
  }
}
