import 'package:finalproject/widgets/title_and_desription_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';
import '../widgets/add_activity_container.dart';
import '../widgets/app_bar.dart';
import '../widgets/date_archive_container.dart';
import '../widgets/decision_container.dart';
import '../widgets/sender_and_category_container.dart';
import '../widgets/wide_container.dart';

class NewInboxView extends StatefulWidget {
  @override
  State<NewInboxView> createState() => _NewInboxViewState();
}

class _NewInboxViewState extends State<NewInboxView> {
  TextEditingController? senderController;
  TextEditingController? titleController;
  TextEditingController? addDecisionController;
  TextEditingController? addNewActivityController;
  TextEditingController? dateInputController;
  TextEditingController? descriptionController;
  @override
  void initState() {
    senderController = TextEditingController();
    senderController = TextEditingController();
    titleController = TextEditingController();
    addDecisionController = TextEditingController();
    addNewActivityController = TextEditingController();
    dateInputController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Column(
          children: [
            SafeArea(
              child: CustomAppBar(),
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
                        senderController: senderController),
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
                    child: WideContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
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
                          IconButton(
                            icon: Icon(
                              Icons.navigate_next_outlined,
                              size: 35,
                              color: ksecondaryColor.withOpacity(0.6),
                            ),
                            onPressed: () {},
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
                    child: WideContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
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
                          IconButton(
                            icon: Icon(
                              Icons.navigate_next_outlined,
                              size: 35,
                              color: ksecondaryColor.withOpacity(0.6),
                            ),
                            onPressed: () {},
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
                        child: Padding(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Activity',
                          style: TextStyle(fontSize: 25),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.navigate_next_outlined,
                            color: kinProgressStatus.withOpacity(0.7),
                            size: 35,
                          ),
                        )
                      ],
                    ),
                  ),
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
