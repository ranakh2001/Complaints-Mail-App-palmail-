import 'package:finalproject/models/categories.dart';
import 'package:finalproject/models/category_mails.dart';

import '../controller/user_controller.dart';
import '../core/helpers/api_base_helper.dart';
import '../models/mail.dart';
import '../models/user.dart';

class CategoryRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<CategoryElement>> getAllCategories() async {
    User2 user = await getLocalUser();
    final categories = await _helper.get('/categories', {
      'Authorization': 'Bearer ${user.token}',
    });
    return Categories.fromMap(categories).categories!;
  }

  Future<List<Mail>> getCategoryMails(int categoryId) async {
    User2 user = await getLocalUser();
    final mails = await _helper.get('/categories/$categoryId/mails', {
      'Authorization': 'Bearer ${user.token}',
    });
    return CategoryMails.fromMap(mails).mails!;
  }
}
