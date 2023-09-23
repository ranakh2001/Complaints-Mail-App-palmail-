// ignore_for_file: file_names

import 'package:easy_localization/easy_localization.dart';
import 'package:finalproject/core/util/constants.dart';
import 'package:finalproject/providers/app_provider.dart';
import 'package:finalproject/screens/auth/login_screen.dart';
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
            Provider.of<AppProvider>(context, listen: false).openDrawer();
          },
          icon: SvgPicture.asset('assets/icons/menu.svg')),
      actions: [
        PopupMenuButton(
          offset: const Offset(-20, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                onTap: () {
                  Provider.of<AppProvider>(context, listen: false)
                      .changeLanguage();
                  Navigator.pushReplacementNamed(context, LoginScreen.id);
                },
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
                      "changeLang".tr(),
                      style: TextStyle(color: kiconColor),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  Navigator.pushReplacementNamed(context, LoginScreen.id);
                },
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
                    Text("logout".tr(), style: TextStyle(color: kiconColor)),
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
