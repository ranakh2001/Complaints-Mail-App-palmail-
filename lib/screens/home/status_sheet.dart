import 'package:finalproject/providers/mail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../core/helpers/api_response.dart';
import '../../core/util/constants.dart';
import '../../models/satuses.dart';
import '../../providers/status_provider.dart';

class StatusSheet extends StatelessWidget {
  const StatusSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MailProvider>(
      builder: (context, mailProvider, child) {
        return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            height: MediaQuery.of(context).size.height * 0.95,
            decoration: BoxDecoration(
                color: kscaffoldBackgroundColor,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30))),
            child: Column(
              children: [
                Row(
                  children: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Cancle",
                          style:
                              TextStyle(color: kinProgressStatus, fontSize: 18),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Consumer<StatusProvider>(
                    builder: (context, statusProvider, child) {
                      return FutureBuilder(
                        future: statusProvider.fetchStatuses(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
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
                                  MailStatus status = snapshot.data![index];

                                  return GestureDetector(
                                    onTap: () {
                                      mailProvider.changeStatus(status);
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(14),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadiusDirectional
                                                      .circular(10),
                                              color: Color(
                                                  int.parse(status.color!))),
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Text(
                                          status.name!,
                                          style: TextStyle(
                                              fontSize: 16, color: ktitleBlack),
                                        ),
                                        const Spacer(),
                                        mailProvider.detailesMail.status!.id ==
                                                status.id
                                            ? SvgPicture.asset(
                                                'assets/icons/selected.svg',
                                                width: 20,
                                                height: 20,
                                              )
                                            : const SizedBox()
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => Divider(
                                      color: kdividerColor,
                                    ),
                                itemCount: 4);
                          }
                          if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          }
                          return const Text("No Data");
                        },
                      );
                    },
                  ),
                ),
              ],
            ));
      },
    );
  }
}
