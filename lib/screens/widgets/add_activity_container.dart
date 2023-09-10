import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';


class AddActivityContainer extends StatelessWidget {
  const AddActivityContainer({
    super.key,
    required this.addNewActivityController,
  });

  final TextEditingController? addNewActivityController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: kiconColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Container(
          width: 300,
          child: TextField(
            controller: addNewActivityController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Add New Activity ...',
              prefix: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 8,
                  child: Icon(
                    CupertinoIcons.person,
                    size: 12,
                  ),
                ),
              ),
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(left: 55),
                child: Icon(
                  CupertinoIcons.location_fill,
                  color: Colors.blue.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
