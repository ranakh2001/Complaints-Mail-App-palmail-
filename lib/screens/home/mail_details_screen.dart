import 'package:easy_localization/easy_localization.dart';
import 'package:finalproject/core/util/constants.dart';
import 'package:finalproject/screens/home/more_edits_sheet.dart';
import 'package:flutter/material.dart';
import '../../models/mail.dart';
import '../widgets/activity_container.dart';
import '../widgets/add_activity_container.dart';
import '../widgets/custom_expansion_tile.dart';
import '../widgets/decision_container.dart';
import '../widgets/details_images_container.dart';
import '../widgets/details_status_container.dart';
import '../widgets/details_tags_container.dart';
import '../widgets/mail_details_container.dart';
import '../widgets/my_appBar.dart';

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
                  title: 'home'.tr(),
                  actions: [
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30))),
                              context: context,
                              builder: (context) => const MoreEditsSheet());
                        },
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
                  const SizedBox(
                    height: 8,
                  ),
                  const DecisionContainer(
                    addDecisionController: null,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
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
                  const AddActivityContainer(addNewActivityController: null),
                ],
              ),
            ),
          )),
    );
  }
}
