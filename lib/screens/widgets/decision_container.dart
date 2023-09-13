import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/util/constants.dart';

class DecisionContainer extends StatelessWidget {
  const DecisionContainer({
    super.key,
    required this.addDecisionController,
  });

  final TextEditingController? addDecisionController;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('decision'.tr(), style: const TextStyle(fontSize: 18)),
            SizedBox(
              width: 200,
              child: TextField(
                controller: addDecisionController,
                decoration: InputDecoration(
                  hintText: '${'addDecision'.tr()}...',
                  hintStyle: TextStyle(color: kdescriptionColor, fontSize: 14),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
