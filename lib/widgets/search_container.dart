import 'package:flutter/material.dart';

import '../constants.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
            border: Border.all(color: kborderColor)),
        child: Row(children: [
          Icon(
            Icons.search,
            color: kiconColor,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            "search",
            style: TextStyle(color: kiconColor),
          )
        ]),
      ),
    );
  }
}
