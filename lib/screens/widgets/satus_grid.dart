import 'package:easy_localization/easy_localization.dart';
import 'package:finalproject/core/util/constants.dart';
import 'package:finalproject/models/satuses.dart';
import 'package:finalproject/providers/status_provider.dart';
import 'package:finalproject/screens/home/status_mails_screen.dart';
import 'package:finalproject/screens/widgets/status_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/helpers/api_response.dart';

class StatusGrid extends StatelessWidget {
  const StatusGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StatusProvider>(
      builder: (context, statusProvider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: FutureBuilder(
            future: statusProvider.fetchStatuses(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: kinProgressStatus,
                  ),
                );
              }
              if (snapshot.hasData) {
                return GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    childAspectRatio: (1 / 0.65),
                    children: List.generate(4, (index) {
                      MailStatus status = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 4),
                        child: StatusContainer(
                            numOfMails: status.mailsCount!,
                            title: status.name!.tr(),
                            color: Color(int.parse(status.color!)),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        StatusMailsScreen(index: index),
                                  ));
                            }),
                      );
                    }));
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              return const Text("No Data");
            },
          ),
        );
      },
    );
  }
}
