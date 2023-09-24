import 'package:finalproject/core/util/constants.dart';
import 'package:finalproject/providers/search_provider_r.dart';
import 'package:finalproject/screens/widgets/search_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../widgets/close_widget.dart';
import 'filter_sheet.dart';

class SearchScreen extends StatelessWidget {
  static const id = '/searchScreen';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: kinProgressStatus,
              )),
          title: Text(
            'Home',
            style: TextStyle(color: kinProgressStatus, fontSize: 16),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: SingleChildScrollView(
            child: Consumer<SearchProviderR>(
              builder: (context, searchProvider, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              cursorColor: kinProgressStatus,
                              onChanged: (value) {
                                if (value == '') {
                                  searchProvider.searchMails.data!.clear();
                                } else {
                                  searchProvider.fetchMails(value);
                                }
                              },
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
                      searchProvider.startSearch
                          ? const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              child: SearchList(),
                            )
                          : const SizedBox()
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }
}
