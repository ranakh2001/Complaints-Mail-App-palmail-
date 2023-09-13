import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/util/constants.dart';
import 'image_row.dart';

class DetailsImagesContainer extends StatelessWidget {
  const DetailsImagesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(30)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "addImage".tr(),
                            style: TextStyle(
                                color: kinProgressStatus, fontSize: 16),
                          ),
                          const ImageRow(),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Divider(
                              color: kiconColor,
                            ),
                          ),
                          const ImageRow()
                        ]),
                  );
  }
}