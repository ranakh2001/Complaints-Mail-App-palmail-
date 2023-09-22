import 'package:easy_localization/easy_localization.dart';
import 'package:finalproject/core/util/constants.dart';
import 'package:finalproject/providers/mail_provider.dart';
import 'package:finalproject/screens/home/more_edits_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/activity_list.dart';
import '../widgets/add_activity_container.dart';
import '../widgets/decision_container.dart';
import '../widgets/details_images_container.dart';
import '../widgets/details_status_container.dart';
import '../widgets/details_tags_container.dart';
import '../widgets/mail_details_container.dart';
import '../widgets/my_appBar.dart';

class MailDetailsScreen extends StatelessWidget {
  static const id = '/mailDetailsScreen';
  const MailDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        height: MediaQuery.of(context).size.height * 0.95,
        child: Scaffold(
            backgroundColor: kscaffoldBackgroundColor,
            body: NestedScrollView(
                // physics: const BouncingScrollPhysics(),
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      MyAppBar(
                        title: 'home'.tr(),
                        actions: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Done",
                                style: TextStyle(
                                    color: kinProgressStatus, fontSize: 16),
                              )),
                          IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(30))),
                                    context: context,
                                    builder: (context) =>
                                        const MoreEditsSheet());
                              },
                              icon: Icon(
                                Icons.more_vert_rounded,
                                color: kinProgressStatus,
                              ))
                        ],
                      )
                    ],
                body: Consumer<MailProvider>(
                  builder: (context, mailProvider, child) {
                    if (mailProvider.mailUpdated) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: kinProgressStatus,
                        ),
                      );
                    } else {
                      return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
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
                                DecisionContainer(
                                  addDecisionController:
                                      Provider.of<MailProvider>(context)
                                          .mailDecisionControoler,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const DetailsImagesContainer(),
                                const ActivityList(),
                                AddActivityContainer(
                                    addNewActivityController:
                                        mailProvider.newActivity),
                              ],
                            ),
                          ));
                    }
                  },
                ))));
  }
}
