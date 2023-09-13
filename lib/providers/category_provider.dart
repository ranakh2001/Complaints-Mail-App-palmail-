import 'package:finalproject/api/categories_repo.dart';
import 'package:finalproject/models/category.dart';
import 'package:flutter/material.dart';

import '../core/helpers/api_response.dart';

class CategoriesProvider extends ChangeNotifier {
  late CategoryRepository _categoriesRepo;

  late ApiResponse<List<CategoryElement>> _categoryList;

  ApiResponse<List<CategoryElement>> get statusList => _categoryList;

  CategoriesProvider() {
    _categoriesRepo = CategoryRepository();
    fetchCategories();
  }

  fetchCategories()async{
    
  }
}
