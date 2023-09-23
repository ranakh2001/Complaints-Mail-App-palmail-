import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../screens/new inbox/new_inbox_view.dart';

class NewInboxProvider extends ChangeNotifier {
  TextEditingController? senderController;
  TextEditingController? titleController;
  TextEditingController? addDecisionController;
  TextEditingController? addNewActivityController;
  TextEditingController? dateInputController;
  TextEditingController? descriptionController;

  NewInboxProvider() {
    // senderController = TextEditingController();
    titleController = TextEditingController();
    addDecisionController = TextEditingController();
    addNewActivityController = TextEditingController();
    dateInputController = TextEditingController();
    descriptionController = TextEditingController();
  }
}
