import 'dart:typed_data';

import 'package:finalproject/api/mail_repo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/mail.dart';
import '../models/satuses.dart';

class MailProvider extends ChangeNotifier {
  late MailRepository _mailRepository;
  TextEditingController mailDecisionControoler = TextEditingController();
  late Mail detailesMail;

  MailProvider() {
    _mailRepository = MailRepository();
  }

  void setDetailesMail(Mail mail) {
    detailesMail = mail;
    mailDecisionControoler.text = detailesMail.decision ?? '';
    notifyListeners();
  }

  changeStatus(MailStatus status) {
    detailesMail.status!.id = status.id;
    detailesMail.status!.color = status.color;
    detailesMail.status!.name = status.name;
    notifyListeners();
  }

  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    }
    print('no image selected');
  }

  selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
  }

  addImage() {
    _mailRepository.uploadImage(
        {'mail_id': detailesMail.id, 'title': 'image title', 'image': ''});
  }

  deleteMail() {
    _mailRepository.deleteMail("${detailesMail.id!}");
    notifyListeners();
  }
}
