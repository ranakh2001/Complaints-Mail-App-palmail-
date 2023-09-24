// ignore_for_file: file_names

import 'package:finalproject/providers/app_provider_r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      leading: IconButton(
          onPressed: () {
            Provider.of<AppProviderR>(context, listen: false).openDrawer();
          },
          icon: SvgPicture.asset('assets/icons/menu.svg')),
      actions: [
        GestureDetector(
          onTap: () {
            Provider.of<AppProviderR>(context, listen: false).toggleIsShown();
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
        ),
      ],
    );
  }
}
