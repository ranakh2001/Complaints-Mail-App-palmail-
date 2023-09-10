import 'package:finalproject/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                      color: kinProgressStatus,
                      size: 35,
                    )
                  : Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: kiconColor,
                      size: 35,
                    ),
            ],
          ),
        ),
        if (_isExpanded) widget.body,
      ],
    );
  }
}
