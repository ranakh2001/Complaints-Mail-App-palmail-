import 'package:finalproject/providers/app_provider.dart';
import 'package:finalproject/screens/home/hidden_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class HomePage extends StatelessWidget {
  static const id = '/homePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AppProvider>(
        builder: (context, appProvider, child) {
          return Stack(children: [
            const HiddenDrawer(),
            AnimatedContainer(
              duration:const Duration(milliseconds: 250),
                transform: Matrix4.translationValues(
                    appProvider.xoffset, appProvider.yoffset, 0)
                  ..scale(appProvider.scaleFactor),
                child: appProvider.drawerItems[appProvider.selectedItem].itemView),
          ]);
        },
      ),
    );
  }
}
