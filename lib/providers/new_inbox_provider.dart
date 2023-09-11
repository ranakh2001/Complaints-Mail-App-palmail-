import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NewInboxProvider with ChangeNotifier {
  TextEditingController? senderController;
  TextEditingController? titleController;
  TextEditingController? addDecisionController;
  TextEditingController? addNewActivityController;
  TextEditingController? dateInputController;
  TextEditingController? descriptionController;

  NewInboxModel() {
    senderController = TextEditingController();
    titleController = TextEditingController();
    addDecisionController = TextEditingController();
    addNewActivityController = TextEditingController();
    dateInputController = TextEditingController();
    descriptionController = TextEditingController();
  }

// You can add more methods and state management logic here if needed
}
