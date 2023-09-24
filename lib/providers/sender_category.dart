import 'package:flutter/material.dart';

import '../models/sender.dart';

class SenderCategoryProvider extends ChangeNotifier {
  TextEditingController? senderController;
  Datum? sender;

  setSenderController(String senderName) {
    senderController!.text = senderName;
  }

  setSender(Datum newSender) {
    sender = newSender;
  }
}
