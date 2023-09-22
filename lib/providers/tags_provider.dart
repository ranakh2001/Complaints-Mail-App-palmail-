import 'package:finalproject/api/tags_repo.dart';
import 'package:finalproject/models/tags.dart';
import 'package:flutter/material.dart';

import '../core/helpers/api_response.dart';

class TagProvider extends ChangeNotifier{
   late TagRepository _tagsRepo;

  late ApiResponse<List<Tag>> _tagsList;

  ApiResponse<List<Tag>> get tagsList => _tagsList;

  TagProvider() {
    _tagsRepo = TagRepository();
    fetchTags();
  }

    fetchTags() async {
    _tagsList = ApiResponse.loading('Fetching statuses');
    notifyListeners();
    try {
      List<Tag> mailTags = await _tagsRepo.getAllTags();
      _tagsList = ApiResponse.completed(mailTags);
      notifyListeners();
    } catch (e) {
      _tagsList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}