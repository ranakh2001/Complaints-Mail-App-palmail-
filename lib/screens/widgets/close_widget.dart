import 'package:flutter/material.dart';

import '../../core/util/constants.dart';

class CloseIconWidget extends StatelessWidget {
  final Function() ontap;
  const CloseIconWidget({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ontap,
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
