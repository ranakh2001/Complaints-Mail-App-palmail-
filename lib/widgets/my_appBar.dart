// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../constants.dart';

class MyAppBar extends StatelessWidget {
  final List<Widget>? actions;
  final String title;
  const MyAppBar({super.key, this.actions, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      leadingWidth: 20,
      title: Text(
        title,
        style: TextStyle(color: kinProgressStatus, fontSize: 18),
      ),
      actions: actions,
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: kinProgressStatus,
          )),
    );
  }
}
