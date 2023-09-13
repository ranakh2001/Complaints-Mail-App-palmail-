import 'package:easy_localization/easy_localization.dart';
import 'package:finalproject/models/category.dart';
import 'package:finalproject/screens/new%20inbox/new_inbox_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../core/helpers/api_response.dart';
import '../../core/util/constants.dart';
import '../../providers/category_provider.dart';
import '../widgets/categories_listView.dart';
import '../widgets/custom_expansion_tile.dart';
import '../widgets/home_appBar.dart';
import '../widgets/mail_container.dart';
import '../widgets/satus_grid.dart';
import '../widgets/search_container.dart';

class HomePage extends StatelessWidget {
  static const id = '/homePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
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
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: Text.rich(TextSpan(children: <WidgetSpan>[
                    for (int i = 0; i < 5; i++) ...{
                      WidgetSpan(
                          child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: ktagBackground,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "allTags".tr(),
                          style: TextStyle(color: ktagColor, fontSize: 14),
                        ),
                      ))
                    }
                  ])),
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
    );
  }
}
