import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class SenderAndCategoryContainer extends StatelessWidget {
  const SenderAndCategoryContainer({
    super.key,
    required this.senderController,
  });

  final TextEditingController? senderController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 378,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 320,
            child: TextField(
              autofocus: true,
              controller: senderController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Sender',
                hintStyle: TextStyle(color: kiconColor),
                prefix: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    CupertinoIcons.person,
                    color: kiconColor,
                  ),
                ),
                suffix: Icon(
                  CupertinoIcons.info,
                  size: 30,
                  color: kinProgressStatus,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Category',
                  style: TextStyle(fontSize: 20),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Other',
                        style: TextStyle(color: ksecondaryColor, fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: IconButton(
                          icon: Icon(
                            Icons.navigate_next,
                            color: ksecondaryColor,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
