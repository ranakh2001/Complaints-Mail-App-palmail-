import 'package:flutter/material.dart';

import '../constants.dart';

class StatusContainer extends StatelessWidget {
  final String title;
  final Color color;

  const StatusContainer({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 70,
                  color: kshadowColor,
                  offset: const Offset(1, 3),
                  blurStyle: BlurStyle.inner)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: color),
                ),
                const Text(
                  "9",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Text(
                title,
                style: TextStyle(color: kiconColor, fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
