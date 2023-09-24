import 'package:finalproject/models/activity.dart';
import 'package:finalproject/providers/mail_provider_r.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/util/constants.dart';
import 'activity_container.dart';
import 'custom_expansion_tile.dart';

class ActivityList extends StatelessWidget {
  const ActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: CustomExpansionTile(
          title: Text(
            "Activities",
            style: TextStyle(color: ktitleBlack, fontSize: 20),
          ),
          body: Consumer<MailProviderR>(
            builder: (context, mailProvider, child) {
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    Activity activity =
                        mailProvider.detailesMail.activities![index];
                    return ActivityContainer(
                      activity: activity,
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 8,
                      ),
                  itemCount: mailProvider.detailesMail.activities!.length);
            },
          )),
    );
  }
}
