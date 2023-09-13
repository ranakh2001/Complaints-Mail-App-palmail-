import 'package:flutter/material.dart';

import '../../core/util/constants.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              'cancel',
              style: TextStyle(fontSize: 18, color: kinProgressStatus),
            ),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 18, color: ktitleBlack),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Done',
              style: TextStyle(fontSize: 18, color: kinProgressStatus),
            ),
          ),
        ],
      ),
    );
  }
}
