// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Status {
  String title;
  Color color;
  bool isSelected;
  Status({
    required this.title,
    required this.color,
     this.isSelected  = false,
  });
}
