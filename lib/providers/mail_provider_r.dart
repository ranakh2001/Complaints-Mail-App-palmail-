import 'dart:convert';
import 'dart:io';

import 'package:finalproject/api/mail_repo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/mail.dart';
import '../models/satuses.dart';

class MailProviderR extends ChangeNotifier {
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

  MailProviderR() {
    _mailRepository = MailRepository();
  }

  // void createMail() {
    // _mailRepository.newMail({
    //   'subject':"new mail subject",
    //   'description':"no description yet",
    //   'sender_id':'267',
    //   'archive_number':'555',
    //   'archive_date':"${DateTime.now()}",
    //   'decision':'',
    //   'status_id':'1',
    //   'final_decision':'',
    //   'tags':jsonEncode([2,3]),
    //   'activities':jsonEncode([{'body':'create activity','user_id':1}])
    // });
  //   _mailRepository.createNewMail(
  //       subject: 'test test',
  //       senderId: '267',
  //       archive: '333',
  //       date: DateTime.now(),
  //       status_id: '1');
  // }

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
    imagesIdForDelete.add(detailesMail.attachments![index].id!.toString());
    imagesPathForDelete.add(detailesMail.attachments![index].image!);
    updateMail();
  }

  updateMail() async {
    Mail updated = await _mailRepository.updateMail({
      'decision': mailDecisionControoler.text,
      'final_decision': mailDecisionControoler.text,
      'tags': [].toString(),
      'activities': jsonEncode(newactivities),
      'status_id': detailesMail.status!.id!.toString(),
      'idAttachmentsForDelete': jsonEncode(imagesIdForDelete),
      'pathAttachmentsForDelete': jsonEncode(imagesPathForDelete)
    }, detailesMail.id!.toString());
    detailesMail = updated;
    notifyListeners();
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
    await _mailRepository.uploadImage(file!, detailesMail.id!);
    mailUpdated = true;
    notifyListeners();
    refresh();
  }

  addnewAcitivity() {
    newactivities.add({'body': newActivity.text, "user_id": 1});
    newActivity.clear();
    updateMail();
    mailUpdated = true;
    notifyListeners();
    refresh();
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
