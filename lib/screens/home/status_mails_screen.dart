import 'package:easy_localization/easy_localization.dart';
import 'package:finalproject/models/mail.dart';
import 'package:finalproject/providers/status_provider_r.dart';
import 'package:finalproject/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/util/constants.dart';
import '../widgets/home_mails.dart';
import '../widgets/my_appBar.dart';

class StatusMailsScreen extends StatelessWidget {
  static const id = '/statusMailsScreen';
  final int index;
  const StatusMailsScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
        MyAppBar(
          onpressed: () => Navigator.pushReplacementNamed(context, HomePage.id),
          title: 'home'.tr(),
        )
      ],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Consumer<StatusProviderR>(
          builder: (context, statusProvider, child) {
            return FutureBuilder(
              future: statusProvider.fetchStatusMails(index),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: kinProgressStatus,
                    ),
                  );
                }
                if (snapshot.hasData) {
                  return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Mail mail = snapshot.data![index];
                        return HomeMails(
                          mail: mail,
                          singleMail: true,
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 8,
                          ),
                      itemCount: snapshot.data!.length);
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                return const Center(
                  child: Text("No Data"),
                );
              },
            );
          },
        ),
      ),
    ));
  }
}
