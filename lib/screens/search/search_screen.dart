import 'package:finalproject/core/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/close_widget.dart';
import '../widgets/home_mails.dart';
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
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
                              suffixIcon: const CloseIconWidget(),
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
                      itemBuilder: (context, index) {
                        return HomeMails(
                          organization: "",
                          singleMail: true,
                          color: '',
                          date: DateTime(2000),
                          description: '',
                          subject: '',
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 16,
                          ),
                      itemCount: 3)
                ],
              ),
            ),
          )),
    );
  }
}
