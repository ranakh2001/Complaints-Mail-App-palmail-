
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

Future<User2?> getUser() async{
  User2? user;
  getLocalUser().then((value) {
    user = value;
  }).catchError((err){
    return null;
  });
  return user;
}

Future<User2> getLocalUser() async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if(prefs.containsKey('user')){
    print(prefs.get('user'));
    return userFromJson(prefs.getString('user')!);
    
  }
  return Future.error('not found');

}