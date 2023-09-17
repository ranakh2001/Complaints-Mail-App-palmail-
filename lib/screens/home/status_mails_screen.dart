import 'package:easy_localization/easy_localization.dart';
import 'package:finalproject/models/mail.dart';
import 'package:finalproject/providers/status_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/helpers/api_response.dart';
import '../../core/util/constants.dart';
import '../widgets/home_mails.dart';
import '../widgets/my_appBar.dart';

class StatusMailsScreen extends StatelessWidget {
  static const id = '/statusMailsScreen';
  const StatusMailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
        MyAppBar(
          title: 'home'.tr(),
        )
      ],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Consumer<StatusProvider>(
          builder: (context, statusProvider, child) {
            if (statusProvider.statusMailsList.status == Status.LOADING) {
              return Center(
                child: CircularProgressIndicator(
                  color: kinProgressStatus,
                ),
              );
            } else if (statusProvider.statusMailsList.status == Status.ERROR) {
              return Center(
                child: Text('${statusProvider.statusMailsList.message}'),
              );
            }

            return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Mail mail = statusProvider.statusMailsList.data![index];
                  return HomeMails(
                    organization:
                        mail.sender == null ? '' : mail.sender!.category!.name!,
                    singleMail: true,
                    color: mail.status!.color!,
                    date: mail.createdAt!,
                    description: mail.description ?? '',
                    subject: mail.subject!,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                itemCount: statusProvider.statusMailsList.data!.length);
          },
        ),
      ),
    ));
  }
}
