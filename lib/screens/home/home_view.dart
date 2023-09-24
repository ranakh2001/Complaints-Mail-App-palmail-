import 'package:easy_localization/easy_localization.dart';
import 'package:finalproject/controller/user_controller.dart';
import 'package:finalproject/models/user.dart';
import 'package:finalproject/providers/app_provider_r.dart';
import 'package:finalproject/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/auth_controller.dart';
import '../../core/util/constants.dart';
import '../new inbox/new_inbox_view.dart';
import '../widgets/categories_listView.dart';
import '../widgets/home_appBar.dart';
import '../widgets/satus_grid.dart';
import '../widgets/search_container.dart';
import '../widgets/tags_container.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const HomeAppBar(),
          ],
          body: Stack(children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SearchContainer(),
                  const StatusGrid(),
                  const CategoriesListView(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16),
                    child: Text(
                      "tags".tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: TagsContainer(),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      context: context,
                      builder: (context) => const NewInboxView(),
                    );
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        border:
                            Border(top: BorderSide(color: Color(0xffD0D0D0)))),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: kinProgressStatus),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "newInBox".tr(),
                          style: GoogleFonts.poppins(
                            color: kinProgressStatus,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ))
          ]),
        ),
        Provider.of<AppProviderR>(context).isShown
            ? Positioned(
                top: 70,
                right: 20,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, LoginScreen.id);
                            Provider.of<AppProviderR>(context, listen: false)
                                .changeLanguage(context);
                            //logout function
                          },
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
                                style:
                                    TextStyle(color: kiconColor, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Divider(
                          color: kdividerColor,
                        ),
                        GestureDetector(
                          onTap: () async {
                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            User2 user = await getLocalUser();
                            logoutcon(user.token!);
                            pref.remove('user');
                            Navigator.pushReplacementNamed(
                                context, LoginScreen.id);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.logout,
                                color: kiconColor,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "logout".tr(),
                                style:
                                    TextStyle(color: kiconColor, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ))
            : const SizedBox()
      ]),
    );
  }
}
