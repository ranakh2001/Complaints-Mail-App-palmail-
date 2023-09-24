import 'package:finalproject/api/categories_repo.dart';
import 'package:finalproject/models/categories.dart';
import 'package:finalproject/models/mail.dart';
import 'package:flutter/material.dart';

import '../core/helpers/api_response.dart';

class CategoriesProviderR extends ChangeNotifier {
  late CategoryRepository _categoriesRepo;

  late ApiResponse<List<CategoryElement>> _categoryList;

  ApiResponse<List<CategoryElement>> get categoryList => _categoryList;

  CategoryElement? selectedCategory;
  CategoriesProviderR() {
    _categoriesRepo = CategoryRepository();
    fetchCategories();
  }

  fetchCategories() async {
    _categoryList = ApiResponse.loading('Fetching statuses');
    notifyListeners();
    try {
      List<CategoryElement> mailCategories =
          await _categoriesRepo.getAllCategories();
      _categoryList = ApiResponse.completed(mailCategories);
      notifyListeners();
    } catch (e) {
      _categoryList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

  Future<List<Mail>> getCategoryMails(int categoryId) async {
    try {
      List<Mail> mails = await _categoriesRepo.getCategoryMails(categoryId);
      return mails;
    } catch (err) {
      return Future.error(err);
    }
  }

  toggleCategory(CategoryElement category) {
    category.isSelected = !category.isSelected;
    notifyListeners();
    selectedCategory = category;
    notifyListeners();
  }
}
