import 'package:finalproject/constants.dart';
import 'package:finalproject/widgets/home_mails.dart';
import 'package:flutter/material.dart';

import '../home/mail_details_screen.dart';

class MailContainer extends StatelessWidget {
  const MailContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, MailDetailsScreen.id);
                  },
                  child: const HomeMails());
            },
            separatorBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 16),
                  child: Divider(
                    color: kiconColor,
                  ),
                ),
            itemCount: 3));
  }
}
