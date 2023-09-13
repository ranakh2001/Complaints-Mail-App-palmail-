import 'package:flutter/material.dart';

import '../../core/util/constants.dart';

class ActivityContainer extends StatelessWidget {
  const ActivityContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://th.bing.com/th/id/OIP.jryuUgIHWL-1FVD2ww8oWgHaHa?pid=ImgDet&rs=1'))),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "Hussam",
                                        style: TextStyle(
                                            color: ktitleBlack, fontSize: 16),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "Today, 11:00 AM",
                                        style: TextStyle(
                                            color: kdescriptionColor,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24.0),
                                    child: Text(
                                      "The issue transferred to AAAA",
                                      style: TextStyle(
                                          color: kdescriptionColor,
                                          fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            );
  }
}