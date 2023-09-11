import 'package:flutter/foundation.dart';

class StatusProvider with ChangeNotifier {
  int _clickedIndex = 0;

  int get clickedIndex => _clickedIndex;

  void setClickedIndex(int index) {
    _clickedIndex = index;
    notifyListeners();
  }
}
