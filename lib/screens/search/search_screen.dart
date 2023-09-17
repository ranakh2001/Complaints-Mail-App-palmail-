import 'package:finalproject/core/util/constants.dart';
import 'package:finalproject/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../widgets/close_widget.dart';
import '../widgets/my_appBar.dart';
import 'filter_sheet.dart';

class SearchScreen extends StatelessWidget {
  static const id = '/searchScreen';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
              [const MyAppBar(title: 'Home')],
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: SingleChildScrollView(
              child: Consumer<SearchProvider>(
                builder: (context, searchProvider, child) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: searchProvider.searchController,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 16),
                                  suffixIconConstraints: const BoxConstraints(),
                                  suffixIcon: CloseIconWidget(
                                    ontap: () {
                                      searchProvider.searchController.clear();
                                    },
                                  ),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: kcloseBackground,
                                  ),
                                  filled: true,
                                  fillColor: ktagBackground),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(30))),
                                    context: context,
                                    builder: (context) => const FilterSheet());
                              },
                              child: SvgPicture.asset(
                                'assets/icons/filter.svg',
                                width: 25,
                                height: 25,
                              ))
                        ],
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {},
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 16,
                              ),
                          itemCount: 3)
                    ],
                  );
                },
              ),
            ),
          )),
    );
  }
}
