import 'package:easy_localization/easy_localization.dart';
import 'package:finalproject/providers/mail_provider_r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../core/util/constants.dart';
import '../home/status_sheet.dart';

class DetailsStatusContainer extends StatelessWidget {
  const DetailsStatusContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MailProviderR>(
      builder: (context, mailProvider, child) {
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              context: context,
              builder: (context) => const StatusSheet(),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(30),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/pending_icon.svg',
                  width: 24,
                  height: 24,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(30),
                      color: Color(
                          int.parse(mailProvider.detailesMail.status!.color!))),
                  child: Text(
                    mailProvider.detailesMail.status!.name!.tr(),
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: kiconColor,
                  size: 32,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
