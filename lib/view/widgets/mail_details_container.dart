import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import 'my_expand_listTile.dart';

class MailDetailsContainer extends StatelessWidget {
  const MailDetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white),
      child: Column(
        children: [
          Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/person.svg',
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Sport Ministry",
                      style: TextStyle(fontSize: 16, color: kiconColor),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Text(
                    "Official organization",
                    style: TextStyle(fontSize: 12, color: kiconColor),
                  ),
                )
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today, 11:00 AM",
                  style: TextStyle(
                      color: kiconColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Arch 2022/1032",
                  style: TextStyle(color: kiconColor, fontSize: 12),
                )
              ],
            )
          ]),
          Divider(
            color: kdividerColor,
          ),
          CustomExpansionTile(
            body: Column(
              children: [
                Text(
                  '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Why do we use it? It is a long established fact that a reader will be distra''',
                  softWrap: true,
                  style: TextStyle(fontSize: 14, color: kdescriptionColor),
                )
              ],
            ),
            title: Text(
              "Title of mail",
              style: TextStyle(color: kiconColor),
            ),
          )
        ],
      ),
    );
  }
}
