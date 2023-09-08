import 'package:finalproject/constants.dart';
import 'package:finalproject/widgets/my_appBar.dart';
import 'package:finalproject/widgets/my_expand_listTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/activity_container.dart';
import '../widgets/decision_container.dart';
import '../widgets/details_images_container.dart';
import '../widgets/details_status_container.dart';
import '../widgets/details_tags_container.dart';
import '../widgets/mail_details_container.dart';

class MailDetailsScreen extends StatelessWidget {
  static const id = '/mailDetailsScreen';
  const MailDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kscaffoldBackgroundColor,
      body: NestedScrollView(
          // physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MyAppBar(
                  title: 'Home',
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_horiz_rounded,
                          color: kinProgressStatus,
                        ))
                  ],
                )
              ],
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MailDetailsContainer(),
                  const DetailsTagsContainer(),
                  const DetailsStatusContainer(),
                  const DecisionContainer(),
                  const DetailsImagesContainer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8),
                    child: CustomExpansionTile(
                        title: Text(
                          "Activity",
                          style: TextStyle(color: ktitleBlack, fontSize: 20),
                        ),
                        body: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return const ActivityContainer();
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 8,
                                ),
                            itemCount: 2)),
                  ),
                  TextField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      suffixIconConstraints: const BoxConstraints(),
                      prefixIconConstraints: const BoxConstraints(),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 16),
                      hintText: 'Add new Activity …',
                      hintStyle:
                          TextStyle(fontSize: 14, color: kdescriptionColor),
                      suffixIcon: SvgPicture.asset(
                        'assets/icons/send.svg',
                      ),
                      prefixIcon: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://th.bing.com/th/id/OIP.jryuUgIHWL-1FVD2ww8oWgHaHa?pid=ImgDet&rs=1'))),
                      ),
                      filled: true,
                      fillColor: ktextFieldFillColor,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
