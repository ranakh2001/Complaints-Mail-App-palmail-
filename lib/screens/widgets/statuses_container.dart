import 'package:finalproject/core/util/constants.dart';
import 'package:finalproject/models/satuses.dart';
import 'package:finalproject/providers/status_provider.dart';
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
      child: Consumer<StatusProvider>(
        builder: (context, statusProvider, child) {
          if (statusProvider.statusList.status == Status.LOADING) {
            return Center(
              child: CircularProgressIndicator(
                color: kinProgressStatus,
              ),
            );
          } else if (statusProvider.statusList.status == Status.ERROR) {
            return Center(
              child: Text('${statusProvider.statusList.message}'),
            );
          }
          return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                MailStatus status = statusProvider.statusList.data![index];

                return GestureDetector(
                  onTap: () {
                    statusProvider.toggleStatus(status);
                  },
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(10),
                            color: Color(int.parse(status.color!))),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        status.name!,
                        style: TextStyle(fontSize: 16, color: ktitleBlack),
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
        },
      ),
    );
  }
}
