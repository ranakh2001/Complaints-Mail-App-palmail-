// ignore_for_file: file_names

import 'package:finalproject/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/util/constants.dart';

class MyAppBar extends StatelessWidget {
  final List<Widget>? actions;
  final String title;
  final Function() onpressed;
  const MyAppBar(
      {super.key, this.actions, required this.title, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      // leadingWidth: 20,
      title: Text(
        title,
        style: TextStyle(color: kinProgressStatus, fontSize: 18),
      ),
      actions: actions,
      leading: IconButton(
          onPressed: onpressed,
          icon: Icon(
            Provider.of<AppProvider>(context).locae == const Locale('en')
                ? Icons.arrow_back_ios_new_rounded
                : Icons.arrow_forward_ios_rounded,
            color: kinProgressStatus,
          )),
    );
  }
}
