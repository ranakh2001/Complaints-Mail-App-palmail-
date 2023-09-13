import 'package:easy_localization/easy_localization.dart';
import 'package:finalproject/core/util/constants.dart';
import 'package:finalproject/providers/status_provider.dart';
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
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  StatusContainer(
                    color: kinBoxStatus,
                    title: 'inBox'.tr(),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  StatusContainer(
                    color: kpendingStatus,
                    title: 'pending'.tr(),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  StatusContainer(
                    color: kinProgressStatus,
                    title: 'inProgress'.tr(),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  StatusContainer(
                    color: kcompletedStatus,
                    title: 'completted'.tr(),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
