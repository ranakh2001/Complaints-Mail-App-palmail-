import 'dart:convert';
import 'dart:io';

import 'package:finalproject/api/mail_repo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/mail.dart';
import '../models/satuses.dart';

class MailProvider extends ChangeNotifier {
  late MailRepository _mailRepository;
  TextEditingController mailDecisionControoler = TextEditingController();
  TextEditingController newActivity = TextEditingController();
  late Mail detailesMail;
  List<String> imagesIdForDelete = [];
  List<String> imagesPathForDelete = [];
  XFile? _file;
  File? file;
  bool mailUpdated = false;
  List<Map<String, dynamic>> newactivities = [];

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

  deleteMail() {
    _mailRepository.deleteMail("${detailesMail.id!}");
    notifyListeners();
  }

  deleteImage(int index) {
    detailesMail.attachments!.removeAt(index);
    notifyListeners();
    imagesIdForDelete.add(detailesMail.attachments![index].id!.toString());
    imagesPathForDelete.add(detailesMail.attachments![index].image!);
  }

  updateMail() async {
    detailesMail = await _mailRepository.updateMail({
      'decision': mailDecisionControoler.text,
      'final_decision': mailDecisionControoler.text,
      'tags': [].toString(),
      'activities': jsonEncode(newactivities),
      'status_id': detailesMail.status!.id!.toString(),
      'idAttachmentsForDelete': jsonEncode(imagesIdForDelete),
      'pathAttachmentsForDelete': jsonEncode(imagesPathForDelete)
    }, detailesMail.id!.toString());
  }

  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      file = File(_file!.path);
      return file;
    }
    print('no image selected');
  }

  selectImage() async {
    file = await pickImage(ImageSource.gallery);
    if (file != null) {
      addImage();
    }
  }

  addImage() async {
    _mailRepository.uploadImage(file!, detailesMail.id!);
    mailUpdated = true;
    notifyListeners();
    refresh();
  }

  addnewAcitivity() {
    newactivities.add({'body': newActivity.text, "user_id": 1});
    newActivity.clear();
    updateMail();
    // mailUpdated = true;
    notifyListeners();
    // refresh();
  }

  refresh() {
    _mailRepository.getSingleMail(detailesMail.id!.toString()).then((value) {
      print(value);
      detailesMail = value;
      mailUpdated = false;
      notifyListeners();
    });
  }
}
