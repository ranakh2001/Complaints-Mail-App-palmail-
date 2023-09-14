import 'package:finalproject/core/util/constants.dart';
import 'package:finalproject/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomExpansionTile extends StatefulWidget {
  final Widget title;
  final Widget body;
  final int? numOfMails;
  final int? categoryId;
  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.body,
    this.numOfMails,
    this.categoryId,
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
            if (widget.categoryId != null) {
              Provider.of<CategoriesProvider>(context, listen: false)
                  .getCategoryMails(widget.categoryId!);
            }
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
