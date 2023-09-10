import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, '/login_screen');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff6589FF),
              Color(0xff003AFC),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/palestine_bird.png'),
            const SizedBox(height: 10,),
            const Center(
              child: Text(
                'ديوان رئيس الوزراء',
                style: TextStyle(
                  fontSize: 31,
                  fontWeight: FontWeight.w400,
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
