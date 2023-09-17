import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'mail_title_widget.dart';

class HomeMails extends StatelessWidget {
  final bool singleMail;
  final String organization;
  final String subject;
  final String description;
  final DateTime date;
  final String color;
  const HomeMails(
      {super.key,
      required this.singleMail,
      required this.organization,
      required this.subject,
      required this.description,
      required this.date,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: singleMail
          ? const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
          : null,
      decoration: singleMail
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(30))
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MailTitle(
            organiztion: organization,
            color: color,
            date: DateFormat('dd/MM/yyyy ,hh:mm').format(date),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              subject,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodySmall,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
