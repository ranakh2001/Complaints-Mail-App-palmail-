import 'package:finalproject/screens/new%20inbox/new_inbox_view.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  Function() doneFunction;

  CustomAppBar({
    required this.doneFunction,
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
            child: TextButton(
              child: Text(
                'cancel',
                style: TextStyle(fontSize: 25, color: kinProgressStatus),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewInboxView(),
                    ));
              },
            ),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 25, color: ktitleBlack),
          ),
          TextButton(
            onPressed: doneFunction,
            child: Text(
              'Done',
              style: TextStyle(fontSize: 25, color: kinProgressStatus),
            ),
          ),
        ],
      ),
    );
  }
}
