import 'package:flutter/foundation.dart';

class TagStateNotifier extends ChangeNotifier {
  List<bool> selectedTags = [];

  TagStateNotifier() {
    selectedTags = List.generate(5, (index) => false);
  }

  void toggleTag(int index) {
    selectedTags[index] = !selectedTags[index];
    notifyListeners();
  }
}
