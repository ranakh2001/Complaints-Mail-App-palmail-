import 'package:finalproject/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      leading: IconButton(
          onPressed: () {}, icon: SvgPicture.asset('assets/icons/menu.svg')),
      actions: [
        PopupMenuButton(
          offset: const Offset(-20, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: 'change language',
                child: Row(
                  children: [
                    Icon(
                      Icons.language,
                      color: kiconColor,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "change language",
                      style: TextStyle(color: kiconColor),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: kiconColor,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text("logout", style: TextStyle(color: kiconColor)),
                  ],
                ),
              ),
            ];
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: NetworkImage(
                      'https://th.bing.com/th/id/OIP.jryuUgIHWL-1FVD2ww8oWgHaHa?pid=ImgDet&rs=1',
                    ),
                    fit: BoxFit.cover),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2)),
          ),
        )
      ],
    );
  }
}
