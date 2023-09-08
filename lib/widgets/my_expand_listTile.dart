import 'package:finalproject/constants.dart';
import 'package:flutter/material.dart';

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final Widget body;
  final int numOfMails;
  const CustomExpansionTile({
    required this.title,
    required this.body,
    required this.numOfMails,
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
              Text(
                widget.title,
                style: const TextStyle(fontSize: 20),
              ),
              const Spacer(),
              _isExpanded
                  ? const SizedBox()
                  : Text(
                      "${widget.numOfMails}",
                      style: TextStyle(color: kiconColor, fontSize: 14),
                    ),
              _isExpanded
                  ? Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: kopenArrowColor,
                      size: 32,
                    )
                  : Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: kiconColor,
                      size: 32,
                    ),
            ],
          ),
        ),
        if (_isExpanded) widget.body,
      ],
    );
  }
}
