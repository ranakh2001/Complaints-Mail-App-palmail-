import 'package:finalproject/api/categories_repo.dart';
import 'package:finalproject/models/category.dart';
import 'package:flutter/material.dart';

import '../core/helpers/api_response.dart';

class CategoriesProvider extends ChangeNotifier {
  late CategoryRepository _categoriesRepo;

  late ApiResponse<List<CategoryElement>> _categoryList;

  ApiResponse<List<CategoryElement>> get categoryList => _categoryList;

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
}
