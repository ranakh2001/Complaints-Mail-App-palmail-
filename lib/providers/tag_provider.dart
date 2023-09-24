import 'package:finalproject/models/tag_model.dart';
import 'package:flutter/material.dart';

class TagStateNotifier extends ChangeNotifier {
  List<bool> selectedTags = [];
  List<TagElement> selectedTagsToShow = [];

  TagStateNotifier() {
    selectedTags = List.generate(100, (index) => false);
  }

  void toggleTag(int index) {
    selectedTags[index] = !selectedTags[index];
    notifyListeners();
  }
}
