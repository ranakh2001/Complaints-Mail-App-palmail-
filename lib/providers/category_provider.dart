import 'package:finalproject/api/categories_repo.dart';
import 'package:finalproject/models/categories.dart';
import 'package:finalproject/models/mail.dart';
import 'package:flutter/material.dart';

import '../core/helpers/api_response.dart';

class CategoriesProvider extends ChangeNotifier {
  late CategoryRepository _categoriesRepo;

  late ApiResponse<List<CategoryElement>> _categoryList;
  late ApiResponse<List<Mail>> _categoryMailList;

  ApiResponse<List<CategoryElement>> get categoryList => _categoryList;
    ApiResponse<List<Mail>> get categoryMailList => _categoryMailList;


  CategoriesProvider() {
    _categoriesRepo = CategoryRepository();
    fetchCategories();
  }

  fetchCategories()async{
     _categoryList = ApiResponse.loading('Fetching statuses');
    notifyListeners();
    try {
      List<CategoryElement> mailCategories = await _categoriesRepo.getAllCategories();
      _categoryList = ApiResponse.completed(mailCategories);
      notifyListeners();
    } catch (e) {
      _categoryList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

  getCategoryMails(int categoryId) async{
     _categoryMailList = ApiResponse.loading('Fetching statuses');
    notifyListeners();
    try {
      List<Mail> categoryMails = await _categoriesRepo.getCategoryMails(categoryId);
      _categoryMailList = ApiResponse.completed(categoryMails);
      notifyListeners();
    } catch (e) {
      _categoryMailList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
