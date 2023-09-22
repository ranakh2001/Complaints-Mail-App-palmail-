import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/util/constants.dart';
import '../../models/activity.dart';

class ActivityContainer extends StatelessWidget {
  final Activity activity;
  const ActivityContainer({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: activity.user == null
                        ? DecorationImage(
                            image: NetworkImage(
                                "$storageUrl/${activity.user!.image!}"),
                            fit: BoxFit.cover)
                        : null),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                activity.user == null ? "" : activity.user!.name!,
                style: TextStyle(color: ktitleBlack, fontSize: 16),
              ),
              const Spacer(),
              Text(
                DateFormat('dd/MM/yyyy').format(activity.createdAt!),
                style: TextStyle(color: kdescriptionColor, fontSize: 12),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              activity.body! ?? '',
              style: TextStyle(color: kdescriptionColor, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
