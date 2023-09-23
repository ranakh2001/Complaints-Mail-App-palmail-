import 'package:flutter/cupertino.dart';

import '../models/user.dart';

class UserState extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
