import 'package:finalproject/core/util/constants.dart';
import 'package:flutter/material.dart';

class MailTitle extends StatelessWidget {
  final String organiztion;
  final String date;
  final String color;

  const MailTitle({super.key, required this.organiztion, required this.date, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(shape: BoxShape.circle, color:Color( int.parse(color))),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(organiztion, style: TextStyle(color: ktitleBlack, fontSize: 14)),
        const Spacer(),
        Text(
          date,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const Icon(
          Icons.arrow_forward_ios,
        )
      ],
    );
  }
}
