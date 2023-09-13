import 'package:finalproject/core/util/constants.dart';
import 'package:finalproject/models/satuses.dart';

import '../core/helpers/api_base_helper.dart';

class StatusRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<MailStatus>> getAllStatuses() async {
    final allStatuses = await _helper.get('/statuses?mail=false', {
      'Authorization': 'Bearer $token',
    });
    print(allStatuses);
    return Statuses.fromJson(allStatuses).statuses!;
  }
}
