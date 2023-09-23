import 'package:easy_localization/easy_localization.dart';
import 'package:finalproject/core/util/constants.dart';
import 'package:finalproject/providers/mail_provider.dart';
import 'package:finalproject/screens/home/mail_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/mail.dart';
import 'mail_title_widget.dart';

class HomeMails extends StatelessWidget {
  final Mail mail;
  final bool singleMail;
  const HomeMails({
    super.key,
    required this.mail,
    required this.singleMail,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<MailProvider>(context, listen: false).setDetailesMail(mail);
        showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          context: context,
          builder: (context) => const MailDetailsScreen(),
        );
      },
      child: Container(
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
              organiztion: mail.sender!.category!.name! ?? '',
              color: mail.status!.color!,
              date: DateFormat('dd/MM/yyyy').format(mail.createdAt!),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                mail.subject! ?? '',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                mail.description ?? '',
                style: Theme.of(context).textTheme.bodySmall,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            mail.tags!.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: RichText(
                      text: TextSpan(children: [
                        for (int i = 0; i < mail.tags!.length; i++) ...{
                          TextSpan(
                              text: "#${mail.tags![i].name} ",
                              style: TextStyle(
                                  color: kinProgressStatus, fontSize: 14))
                        }
                      ]),
                    ),
                  )
                : const SizedBox(),
            mail.attachments!.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "$storageUrl/${mail.attachments![0].image}"),
                                  fit: BoxFit.cover)),
                        ),
                        mail.attachments!.length >= 2
                            ? Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 4),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "$storageUrl/${mail.attachments![1].image}"),
                                        fit: BoxFit.cover)),
                              )
                            : const SizedBox()
                      ],
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
