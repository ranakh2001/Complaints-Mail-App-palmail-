import 'package:flutter/material.dart';

import '../../constants.dart';
import 'custom_expansion_tile.dart';

class WideContainer extends StatelessWidget {
  final Function()? onTap;
  final Widget title;
  final Widget body;

  const WideContainer({
    this.onTap,
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: CustomExpansionTile(title: title, body: body),

          // child: CustomExpansionTile(
          //   title: child,
          //   body: SizedBox(),
          // ),
        ),
      ),
    );
  }
}
