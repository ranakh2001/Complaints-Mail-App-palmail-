import 'package:flutter/material.dart';

import 'custom_expansion_tile.dart';

class WideContainer extends StatelessWidget {
  final Widget child;
  const WideContainer({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 378,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomExpansionTile(
          title: child,
          body: SizedBox(),
        ),
      ),
    );
  }
}
