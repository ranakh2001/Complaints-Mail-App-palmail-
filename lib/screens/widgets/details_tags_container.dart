import 'package:flutter/material.dart';

import '../../core/util/constants.dart';
import 'my_expand_listTile.dart';

class DetailsTagsContainer extends StatelessWidget {
  const DetailsTagsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: CustomExpansionTile(
          title: Text(
            "# Tags",
            style: TextStyle(color: kiconColor, fontSize: 16),
          ),
          body: Text.rich(TextSpan(children: <WidgetSpan>[
            for (int i = 0; i < 5; i++) ...{
              WidgetSpan(
                  child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: ktagBackground,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "All tags",
                  style: TextStyle(color: ktagColor, fontSize: 14),
                ),
              ))
            }
          ])),
        ));
  }
}
