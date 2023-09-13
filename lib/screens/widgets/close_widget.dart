import 'package:flutter/material.dart';

import '../../core/util/constants.dart';

class CloseIconWidget extends StatelessWidget {
  const CloseIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: kcloseBackground),
          child: Icon(
            Icons.close_rounded,
            color: kscaffoldBackgroundColor,
          ),
        ));
  }
}
