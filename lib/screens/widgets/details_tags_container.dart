import 'package:finalproject/providers/mail_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/util/constants.dart';
import 'custom_expansion_tile.dart';

class DetailsTagsContainer extends StatelessWidget {
  const DetailsTagsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MailProvider>(
      builder: (context, mailProvider, child) {
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
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(TextSpan(children: <WidgetSpan>[
                    for (int i = 0;
                        i < mailProvider.detailesMail.tags!.length;
                        i++) ...{
                      WidgetSpan(
                          child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: ktagBackground,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          mailProvider.detailesMail.tags![i].name!,
                          style: TextStyle(color: ktagColor, fontSize: 14),
                        ),
                      ))
                    }
                  ]))
                ],
              ),
            ));
      },
    );
  }
}
