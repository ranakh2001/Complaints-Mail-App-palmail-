import 'package:finalproject/models/user.dart';
import 'package:finalproject/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../controller/auth_controller.dart';
import '../../controller/user_controller.dart';


class GuestScreen extends StatefulWidget {

  static const id = '/guestScreen';
  const GuestScreen({super.key});

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  late Future<User2?> user;


  Future<void> logout() async {
   User2 userTok = await getLocalUser();

    bool result = await logoutcon(userTok!.token!);
    if (result == true) {

      Navigator.pushReplacementNamed(context, LoginScreen.id);
    } else {
      print('reeor');
    }
  }



  @override
  void initState() {
    user = getUser();
    super.initState();
  }

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
                  '',
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
             Column(
              children: [
                FutureBuilder(future: getLocalUser(),builder: (context,snapshot){
                   // User user = snapshot.data!.user!;
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return CircularProgressIndicator();
                  }
                  if(snapshot.hasData){
                    return Text('Hello ${snapshot.data!.user!.name}....');
                  }
                  if(snapshot.hasError){
                    print('error');
                  }
                  return  Text('loading ');
                }),
                const SizedBox(
                  height: 20,
                ),
                const Text('Please contact the admin to change your role '),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.blue
                ),
                onPressed: logout,
                child: const Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 70.0, vertical: 14),
                  child: Text('LOGOUT',style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
