import 'package:easy_localization/easy_localization.dart';
import 'package:finalproject/models/attachment.dart';
import 'package:finalproject/providers/mail_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/util/constants.dart';
import 'image_row.dart';

class DetailsImagesContainer extends StatelessWidget {
  const DetailsImagesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MailProvider>(
      builder: (context, mailProvider, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(30)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            GestureDetector(
              onTap: () {
                mailProvider.selectImage();
              },
              child: Text(
                "addImage".tr(),
                style: TextStyle(color: kinProgressStatus, fontSize: 16),
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Attachment attachment =
                      mailProvider.detailesMail.attachments![index];
                  return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: ImageRow(
                        url: attachment.image!,
                      ));
                },
                separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Divider(
                        color: kiconColor,
                      ),
                    ),
                itemCount: mailProvider.detailesMail.attachments!.length)
          ]),
        );
      },
    );
  }
}
