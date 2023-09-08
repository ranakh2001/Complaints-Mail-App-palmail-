import 'package:flutter/material.dart';

import '../constants.dart';

class ImageRow extends StatelessWidget {
  const ImageRow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: kremoveColor,
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                width: 32,
                                height: 32,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                        image: NetworkImage(
                                            'https://th.bing.com/th/id/OIP.jryuUgIHWL-1FVD2ww8oWgHaHa?pid=ImgDet&rs=1'))),
                              ),
                              Text(
                                'Image',
                                style:
                                    TextStyle(fontSize: 16, color: ktitleBlack),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.menu_rounded,
                                color: kiconColor,
                              )
                            ],
                          );
  }
}