import 'package:flutter/material.dart';

import '../constants.dart';

class MailAndDescriptionContainer extends StatelessWidget {
  const MailAndDescriptionContainer({
    super.key,
    required this.titleController,
    required this.descriptionController,
  });

  final TextEditingController? titleController;
  final TextEditingController? descriptionController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 378,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12, top: 12),
            child: Container(
              width: 320,
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title of mail',
                  hintStyle: TextStyle(color: kiconColor, fontSize: 26),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12,
            ),
            child: Container(
              width: 320,
              child: TextField(
                autofocus: true,
                controller: descriptionController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Description',
                  hintStyle: TextStyle(color: kiconColor, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
