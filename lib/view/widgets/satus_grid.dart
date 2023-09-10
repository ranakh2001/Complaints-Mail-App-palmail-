import 'package:finalproject/constants.dart';
import 'package:finalproject/view/widgets/status_container.dart';
import 'package:flutter/material.dart';

class StatusGrid extends StatelessWidget {
  const StatusGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              StatusContainer(
                color: kinBoxStatus,
                title: 'Inbox',
              ),
              const SizedBox(
                width: 8,
              ),
              StatusContainer(
                color: kpendingStatus,
                title: 'Pending',
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
                title: 'In progress',
              ),
              const SizedBox(
                width: 8,
              ),
              StatusContainer(
                color: kcompletedStatus,
                title: 'Completed',
              ),
            ],
          )
        ],
      ),
    );
  }
}
