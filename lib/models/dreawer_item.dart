// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DrawerMenueItem {
  String title;
  TextStyle? style = const TextStyle(color: Colors.white, fontSize: 16);
  bool isSelected = false;
  Widget itemView;
  DrawerMenueItem({
    required this.title,
    required this.itemView,
    this.style,
  });
}
