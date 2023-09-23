// ignore_for_file: library_private_types_in_public_api

import 'package:finalproject/core/util/constants.dart';
import 'package:finalproject/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomExpansionTile extends StatefulWidget {
  final Widget title;
  final Widget body;
  final int? numOfMails;
  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.body,
    this.numOfMails,
  });

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              widget.title,
              const Spacer(),
              widget.numOfMails == null
                  ? const SizedBox()
                  : Text(
                      widget.numOfMails.toString(),
                      style: TextStyle(color: kiconColor),
                    ),
              _isExpanded
                  ? Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: kiconColor,
                      size: 35,
                    )
                  : Icon(
                      Provider.of<AppProvider>(context).locae ==
                              const Locale('ar')
                          ? Icons.arrow_back_ios_new_rounded
                          : Icons.arrow_forward_ios_rounded,
                      color: kiconColor,
                    ),
            ],
          ),
        ),
        if (_isExpanded) widget.body,
      ],
    );
  }
}
