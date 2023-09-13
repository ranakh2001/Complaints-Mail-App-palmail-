import 'package:finalproject/core/util/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/categories_container.dart';
import '../widgets/date_piker_container.dart';
import '../widgets/statuses_container.dart';

class FilterSheet extends StatelessWidget {
  const FilterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.95,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Cancle",
                      style: TextStyle(color: kinProgressStatus, fontSize: 18),
                    )),
                Text(
                  "Filter",
                  style: TextStyle(color: ktitleBlack, fontSize: 18),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Done",
                      style: TextStyle(color: kinProgressStatus, fontSize: 18),
                    ))
              ],
            ),
            const CategoriewContainer(),
            const SizedBox(
              height: 18,
            ),
            const StatusesContainer(),
            const SizedBox(
              height: 18,
            ),
            const DatePickerContainer(),
          ],
        ),
      ),
    );
  }
}
