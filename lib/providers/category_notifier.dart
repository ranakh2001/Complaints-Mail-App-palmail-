import 'package:flutter/foundation.dart';

class CategoryProvider with ChangeNotifier {
  int _clickedIndex = 0;

  int get clickedIndex => _clickedIndex;

  void setClickedIndex(int index) {
    _clickedIndex = index;
    notifyListeners();
  }
}
