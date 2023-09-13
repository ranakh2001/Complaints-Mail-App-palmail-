import 'package:finalproject/models/category.dart';

import '../core/helpers/api_base_helper.dart';
import '../core/util/constants.dart';

class CategoryRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<CategoryElement>> getAllCategories() async {
    final categories = await _helper.get('/categories', {
      'Authorization': 'Bearer $token',
    });
    print(categories);
    return Categories.fromMap(categories).categories!;
  }
}
