import 'dart:convert';

import 'package:finalproject/controllers/mail_controller.dart';
import 'package:finalproject/models/category_model.dart';
import 'package:finalproject/screens/new%20inbox/tag_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../models/mail.dart';
import '../../models/sender.dart';
import '../../models/tag_model.dart';
import '../../providers/date_archive.dart';
import '../../providers/new_inbox_provider.dart';
import '../../providers/sender_search_provider.dart';
import '../../providers/tag_provider.dart';
import '../widgets/add_activity_container.dart';
import '../widgets/app_bar.dart';
import '../widgets/custom_expansion_tile.dart';
import '../widgets/date_archive_container.dart';
import '../widgets/decision_container.dart';
import '../widgets/sender_and_category_container.dart';
import '../widgets/title_and_desription_container.dart';
import '../widgets/wide_container.dart';
import 'package:http/http.dart' as http;
import 'tag_view.dart';

class NewInboxView extends StatelessWidget {
  final String? selectedSenderName;
  final Datum? selectedSender;
  final CategoryElement? selectedCategory;
  final List<String>? selectedTags;

  NewInboxView(
      {super.key,
      this.selectedSender,
      this.selectedCategory,
      this.selectedTags,
      this.selectedSenderName});

  void _createNewMail(
    BuildContext context,
    String subject,
    String description,
    int senderId,
    String archiveNumber,
    DateTime date,
    String decision,
    int statusId,
    String finalDecision,
    List<int>? tags,
    List<Map<String, dynamic>>? activities,
  ) {
    createNewMail(
            subject: subject,
            description: description,
            senderId: senderId,
            archive: archiveNumber,
            date: date,
            decision: decision,
            status_id: statusId,
            final_decision: finalDecision,
            tags: tags,
            activities: activities)
        .then((newMail) {
      if (newMail == true) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Mail created successfully'),
          backgroundColor: Colors.black,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(12),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to create mail'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(12),
        ));
      }
    }).catchError((e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to create mail: $e'),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(12),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final senderSearchModel = Provider.of<SenderSearchProvider>(context);
    Datum selectedSender = senderSearchModel.selectedSender;
    final activities = [
      Activity(id: 1, body: 'Description 1'),
      Activity(id: 2, body: 'Description 2'),
    ];

    // print(Provider.of<TagStateNotifier>(context).selectedTagsToShow.toString());

    final tagStateNotifier = context.watch<TagStateNotifier>();
    List<int> tagsListIDs = [];
    for (int i = 0; i < tagStateNotifier.selectedTagsToShow.length; i++) {
      tagsListIDs.add(tagStateNotifier.selectedTagsToShow[i].id!);
    }
    final dateOfMail = Provider.of<DateArchiveProvider>(context).selectedDate;
    final archiveOfMail =
        Provider.of<DateArchiveProvider>(context).archiveController.text;

    final newInboxProvider =
        Provider.of<NewInboxProvider>(context, listen: false);
    // final senderController = newInboxProvider.senderController;
    final titleController = newInboxProvider.titleController;
    final addDecisionController = newInboxProvider.addDecisionController;
    final addNewActivityController = newInboxProvider.addNewActivityController;
    final descriptionController = newInboxProvider.descriptionController;

    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Column(
          children: [
            SafeArea(
              child: CustomAppBar(
                doneFunction: () {
                  _createNewMail(
                      context,
                      titleController!.text,
                      descriptionController!.text,
                      selectedSender.id!,
                      archiveOfMail,
                      dateOfMail,
                      addDecisionController!.text,
                      1,
                      '',
                      tagsListIDs, []);
                  print('done');
                },

                // doneFunction: () async {
                //   try {
                //     final mailData = await createNewMail();
                //     print(mailData.subject);
                //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //       content: Text('Added successfully'),
                //       backgroundColor: Colors.black,
                //       behavior: SnackBarBehavior.floating,
                //       margin: EdgeInsets.all(12),
                //     ));
                //   } catch (e) {
                //     print('Error: $e');
                //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //       content: Text('Unfortunately, Mail has not added!'),
                //       backgroundColor: Colors.red,
                //       behavior: SnackBarBehavior.floating,
                //       margin: EdgeInsets.all(12),
                //     ));
                //     Navigator.pop(context);
                //
                //   }
                // },
                title: 'New Inbox',
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SenderAndCategoryContainer(
                        selectedCategory: selectedCategory,
                        senderController:
                            TextEditingController(text: selectedSender.name)),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: MailAndDescriptionContainer(
                        titleController: titleController,
                        descriptionController: descriptionController),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: DateArchiveContainer(),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => TagView()));
                      },
                      child: WideContainer(
                        title: Row(
                          children: [
                            Icon(Icons.tag, color: ksecondaryColor),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Tags',
                              style: TextStyle(
                                  fontSize: 20, color: ksecondaryColor),
                            ),
                          ],
                        ),
                        // body: Expanded(child: Text('${selectedTags!.length}')),
                        // body: SizedBox(),
                        body: Provider.of<TagStateNotifier>(context)
                                .selectedTagsToShow
                                .isEmpty
                            ? SizedBox()
                            : Container(
                                child: Wrap(
                                  //كيف اخلي طول ال container على حسب ما يوسع عدد التاجز؟؟
                                  runSpacing: 16,
                                  spacing: 16,
                                  children:
                                      Provider.of<TagStateNotifier>(context)
                                          .selectedTagsToShow
                                          .asMap()
                                          .entries
                                          .map((entry) {
                                    final index = entry.key;
                                    final item = entry.value;
                                    return Container(
                                      height: 35,
                                      width: MediaQuery.of(context).size.width *
                                          0.23,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: kcloseBackground),
                                      padding: EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          '#${item.name ?? ""}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: ktagColor,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TagView()));
                          // print(selectedTags!.length);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: WideContainer(
                      body: SizedBox(),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.tag, color: ksecondaryColor),
                          const SizedBox(
                            width: 12,
                          ),
                          Container(
                            height: 32,
                            width: 76,
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Center(
                              child: Text(
                                'Inbox',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: DecisionContainer(
                        addDecisionController: addDecisionController),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: WideContainer(
                        body: SizedBox(),
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Add Image',
                            style: TextStyle(
                                color: kinProgressStatus,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: CustomExpansionTile(
                        title: Text(
                          'Activity',
                          style: TextStyle(fontSize: 25),
                        ),
                        body: SizedBox(),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Center(
                          child: AddActivityContainer(
                              addNewActivityController:
                                  addNewActivityController))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
