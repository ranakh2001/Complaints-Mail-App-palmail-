import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

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
