import 'package:finalproject/models/categories.dart';
import 'package:finalproject/models/category_mails.dart';

import '../core/helpers/api_base_helper.dart';
import '../core/util/constants.dart';
import '../models/mail.dart';

class CategoryRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<CategoryElement>> getAllCategories() async {
    final categories = await _helper.get('/categories', {
      'Authorization': 'Bearer $token',
    });
    return Categories.fromMap(categories).categories!;
  }

  Future<List<Mail>> getCategoryMails(int categoryId) async {
    final mails = await _helper.get('/categories/$categoryId/mails', {
      'Authorization': 'Bearer $token',
    });
    print(mails);
    return CategoryMails.fromMap(mails).mails!;
  }
}
