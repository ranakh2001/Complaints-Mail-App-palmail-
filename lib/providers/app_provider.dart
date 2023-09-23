import 'package:easy_localization/easy_localization.dart';
import 'package:finalproject/models/dreawer_item.dart';
import 'package:finalproject/screens/auth/login_screen.dart';
import 'package:finalproject/screens/home/home_view.dart';
import 'package:finalproject/screens/home/user_profile.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  double xoffset = 0;
  double yoffset = 0;
  double scaleFactor = 1;
  bool isOpen = false;
  Locale locae = const Locale('en');
  bool isEng = true;
  int selectedItem = 0;
  bool isShown = false;

  toggleIsShown() {
    isShown = !isShown;
    notifyListeners();
  }

  List<DrawerMenueItem> drawerItems = [
    DrawerMenueItem(
      title: "Home",
      itemView: const HomePageView(),
    ),
    DrawerMenueItem(title: "Profile", itemView: const UserProfile()),
    DrawerMenueItem(title: "Users", itemView: const Placeholder()),
    DrawerMenueItem(title: "Logout", itemView: const Placeholder())
  ];

  void changeLanguage(BuildContext context) {
    if (isEng) {
      isEng = !isEng;
      isShown = false;
      locae = const Locale('ar');
      context.setLocale(const Locale('ar'));
    } else {
      isEng = !isEng;
      isShown = false;
      locae = const Locale('en');
      context.setLocale(const Locale('en'));
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
      if (!isEng) {
        xoffset = -100;
        yoffset = 50;
        scaleFactor = 0.9;
        isOpen = true;
      } else {
        xoffset = 150;
        yoffset = 70;
        scaleFactor = 0.8;
        isOpen = true;
      }
    }
    notifyListeners();
  }

  changeView(int index, BuildContext context) {
    if (index == 0 || index == 1 || index == 2) {
      drawerItems[index].isSelected = true;
      if (drawerItems[index].isSelected) {
        drawerItems[index].style = const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
        selectedItem = index;
      }
      xoffset = 0;
      yoffset = 0;
      scaleFactor = 1;
      isOpen = false;
      notifyListeners();
    }
    if (index == 4) {
      // put logout function and delete user from shared preferance

      Navigator.pushReplacementNamed(context, LoginScreen.id);
    }
  }
}
