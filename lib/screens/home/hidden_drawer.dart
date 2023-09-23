import 'package:finalproject/core/util/constants.dart';
import 'package:finalproject/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HiddenDrawer extends StatelessWidget {
  const HiddenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Image.asset(
                'assets/images/palestine_bird.png',
                width: 100,
                height: 100,
              ),
            ),
            const Text(
              "ديوان رئيس الوزراء",
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            Consumer<AppProvider>(
              builder: (context, appProvider, child) {
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          appProvider.changeView(index,context);
                        },
                        child: Text(
                          appProvider.drawerItems[index].title,
                          style: appProvider.drawerItems[index].isSelected
                              ? const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)
                              : const TextStyle(
                                  color: Colors.white, fontSize: 14),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 4,
                        ),
                    itemCount: appProvider.drawerItems.length);
              },
            )
          ],
        ),
      ),
    );
  }
}
