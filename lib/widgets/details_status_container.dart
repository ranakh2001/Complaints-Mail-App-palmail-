import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class DetailsStatusContainer extends StatelessWidget {
  const DetailsStatusContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.circular(30),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/pending_icon.svg',
                        width: 24,
                        height: 24,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 16),
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(30),
                            color: kpendingStatus),
                        child: Text(
                          "Pending",
                          style: TextStyle(fontSize: 16, color: ktitleBlack),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: kiconColor,
                        size: 32,
                      )
                    ],
                  ),
                );
  }
}