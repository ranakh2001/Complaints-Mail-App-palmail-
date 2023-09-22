import 'package:finalproject/models/tags.dart';

import '../core/helpers/api_base_helper.dart';
import '../core/util/constants.dart';

class TagRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Tag>> getAllTags() async {
    final tags = await _helper.get('/tags', {
      'Authorization': 'Bearer $token',
    });
    return Tags.fromMap(tags).tags!;
  }
}
