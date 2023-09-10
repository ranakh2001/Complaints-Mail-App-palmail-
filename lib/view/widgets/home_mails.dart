import 'package:flutter/material.dart';

import '../../constants.dart';
import 'mail_title_widget.dart';

class HomeMails extends StatelessWidget {
  final bool singleMail;
  const HomeMails({super.key, required this.singleMail});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:singleMail? const EdgeInsets.symmetric(horizontal: 16, vertical: 8):null,
      decoration:singleMail? BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(30)):null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MailTitle(
            statusColor: kinProgressStatus,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Here we add the subject",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "And here excerpt of the mail, can added to this location. And we can do more to this like ",
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
