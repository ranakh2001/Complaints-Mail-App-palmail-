import 'package:finalproject/core/util/constants.dart';
import 'package:finalproject/models/satuses.dart';
import 'package:finalproject/providers/status_provider_r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../core/helpers/api_response.dart';

class StatusesContainer extends StatelessWidget {
  const StatusesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Consumer<StatusProviderR>(
        builder: (context, statusProvider, child) {
          return FutureBuilder(
            future: statusProvider.fetchStatuses(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: kinProgressStatus,
                  ),
                );
              }
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              if (snapshot.hasData) {
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      MailStatus status = snapshot.data![index];

                      return GestureDetector(
                        onTap: () {
                          statusProvider.toggleStatus(status);
                        },
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(10),
                                  color: Color(int.parse(status.color!))),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              status.name!,
                              style:
                                  TextStyle(fontSize: 16, color: ktitleBlack),
                            ),
                            const Spacer(),
                            status.isSelected
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
              return const Text("No Data");
            },
          );
        },
      ),
    );
  }
}
