import 'package:finalproject/models/tags.dart';

import '../controller/user_controller.dart';
import '../core/helpers/api_base_helper.dart';
import '../models/user.dart';

class TagRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Tag>> getAllTags() async {
    User2 user = await getLocalUser();
    final tags = await _helper.get('/tags', {
      'Authorization': 'Bearer ${user.token}',
    });
    return Tags.fromMap(tags).tags!;
  }
}
