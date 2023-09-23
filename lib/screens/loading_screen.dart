
import 'package:finalproject/screens/auth/login_screen.dart';
import 'package:finalproject/screens/guest/guest-screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen extends StatefulWidget {
  static const id = '/loadingScreen';
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void checkLogin() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey('user') && mounted){
      Navigator.pushNamed(context, GuestScreen.id);
    } else {
      Navigator.pushNamed(context, LoginScreen.id);
    }
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
