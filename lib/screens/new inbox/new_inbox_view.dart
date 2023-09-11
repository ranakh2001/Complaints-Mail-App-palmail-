import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../providers/new_inbox_provider.dart';
import '../widgets/add_activity_container.dart';
import '../widgets/app_bar.dart';
import '../widgets/custom_expansion_tile.dart';
import '../widgets/date_archive_container.dart';
import '../widgets/decision_container.dart';
import '../widgets/sender_and_category_container.dart';
import '../widgets/title_and_desription_container.dart';
import '../widgets/wide_container.dart';
import 'package:http/http.dart' as http;

class NewInboxView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newInboxProvider = Provider.of<NewInboxProvider>(context);
    final senderController = newInboxProvider.senderController;
    final titleController = newInboxProvider.titleController;
    final addDecisionController = newInboxProvider.addDecisionController;
    final addNewActivityController = newInboxProvider.addNewActivityController;
    final dateInputController = newInboxProvider.dateInputController;
    final descriptionController = newInboxProvider.descriptionController;

    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Column(
          children: [
            SafeArea(
              child: CustomAppBar(
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
                        children: [
                          Icon(Icons.tag, color: ksecondaryColor),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            'Tags',
                            style:
                                TextStyle(fontSize: 20, color: ksecondaryColor),
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
