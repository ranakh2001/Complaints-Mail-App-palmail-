import 'package:finalproject/screens/widgets/add_activity_container.dart';
import 'package:finalproject/screens/widgets/app_bar.dart';
import 'package:finalproject/screens/widgets/custom_expansion_tile.dart';
import 'package:finalproject/screens/widgets/date_archive_container.dart';
import 'package:finalproject/screens/widgets/decision_container.dart';
import 'package:finalproject/screens/widgets/sender_and_category_container.dart';
import 'package:finalproject/screens/widgets/title_and_desription_container.dart';
import 'package:finalproject/screens/widgets/wide_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/util/constants.dart';

class NewInboxView extends StatefulWidget {
  static const id = '/newInbox';
  const NewInboxView({super.key});

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
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      height: MediaQuery.of(context).size.height * 0.95,
      child: Scaffold(
        body: Column(
          children: [
            const SafeArea(
              child: CustomAppBar(
                title: 'New Inbox',
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SenderAndCategoryContainer(
                        senderController: senderController),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: MailAndDescriptionContainer(
                        titleController: titleController,
                        descriptionController: descriptionController),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: DateArchiveContainer(),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: WideContainer(
                      child: Row(
                        children: [
                          Icon(Icons.tag, color: ksecondaryColor),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Tags',
                            style:
                                TextStyle(fontSize: 16, color: ksecondaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: WideContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/pending_icon.svg',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 32,
                            width: 76,
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: const Center(
                              child: Text(
                                'Inbox',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: DecisionContainer(
                        addDecisionController: addDecisionController),
                  ),
                  const SizedBox(
                    height: 8,
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
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: CustomExpansionTile(
                        title: Text(
                          'Activity',
                          style: TextStyle(fontSize: 20),
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
