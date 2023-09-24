import 'package:finalproject/providers/mail_provider_r.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/util/constants.dart';
import 'image_view.dart';

class ImageRow extends StatelessWidget {
  final String url;
  final int index;
  const ImageRow({super.key, required this.url, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<MailProviderR>(
      builder: (context, mailProvider, child) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                print("delete");
                mailProvider.deleteImage(index);
              },
              child: Container(
                decoration:
                    BoxDecoration(color: kremoveColor, shape: BoxShape.circle),
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => ImageView(imageUrl: "$storageUrl/$url"),
                );
              },
              child: Container(
                width: 32,
                height: 32,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage("$storageUrl/$url"),
                        fit: BoxFit.cover)),
              ),
            ),
            Text(
              'Image',
              style: TextStyle(fontSize: 16, color: ktitleBlack),
            ),
            const Spacer(),
            Icon(
              Icons.menu_rounded,
              color: kiconColor,
            )
          ],
        );
      },
    );
  }
}
