import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GuestScreen extends StatelessWidget {
  const GuestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/images/menu.svg',
                  width: 26,
                  height: 10,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/hij.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const Column(
              children: [
                Text('Hello Ahmed...'),
                SizedBox(
                  height: 20,
                ),
                Text('Please contact the admin to change your role '),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: const Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 70.0, vertical: 14),
                  child: Text('LOGOUT'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
