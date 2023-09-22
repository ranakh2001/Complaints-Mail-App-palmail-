import 'package:flutter/material.dart';

import '../../core/util/constants.dart';
import 'image_view.dart';

class ImageRow extends StatelessWidget {
  final String url;
  const ImageRow({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
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
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => ImageView(imageUrl: "$storageUrl/$url"),
            //     ));
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
  }
}
