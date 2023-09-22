import 'package:easy_localization/easy_localization.dart';
import 'package:finalproject/providers/mail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../core/util/constants.dart';
import 'custom_expansion_tile.dart';

class MailDetailsContainer extends StatelessWidget {
  const MailDetailsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MailProvider>(
      builder: (context, mailProvider, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: Column(
            children: [
              Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/person.svg',
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          mailProvider.detailesMail.sender!.name!,
                          style: TextStyle(fontSize: 16, color: kiconColor),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: Text(
                        mailProvider.detailesMail.sender!.category!.name!,
                        style: TextStyle(fontSize: 12, color: kiconColor),
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      DateFormat('dd/MM/yyyy').format(mailProvider.detailesMail.createdAt!),
                      style: TextStyle(
                          color: kiconColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      mailProvider.detailesMail.archiveNumber!,
                      style: TextStyle(color: kiconColor, fontSize: 12),
                    )
                  ],
                )
              ]),
              Divider(
                color: kdividerColor,
              ),
              CustomExpansionTile(
                body: Column(
                  children: [
                    Text(
                      mailProvider.detailesMail.description ?? '',
                      softWrap: true,
                      style: TextStyle(fontSize: 14, color: kdescriptionColor),
                    )
                  ],
                ),
                title: Text(
                  mailProvider.detailesMail.subject ?? '',
                  style: TextStyle(color: kiconColor),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
