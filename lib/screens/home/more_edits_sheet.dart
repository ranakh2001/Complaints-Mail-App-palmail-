import 'package:flutter/material.dart';

import '../../constants.dart';

import '../widgets/button_container.dart';
import '../widgets/close_widget.dart';

class MoreEditsSheet extends StatelessWidget {
  const MoreEditsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          color: kscaffoldBackgroundColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                "Title of Mail",
                style: TextStyle(color: ktitleBlack, fontSize: 14),
              ),
              const Spacer(),
              const CloseIconWidget(),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonContainer(
                icon: Icons.archive,
                iconColor: ktagColor,
                onTap: () {},
                title: 'Archive',
              ),
              ButtonContainer(
                icon: Icons.ios_share_rounded,
                iconColor: kinProgressStatus,
                onTap: () {},
                title: 'Share',
              ),
              ButtonContainer(
                icon: Icons.delete,
                iconColor: kremoveColor,
                onTap: () {},
                title: 'Delete',
              ),
            ],
          )
        ],
      ),
    );
  }
}
