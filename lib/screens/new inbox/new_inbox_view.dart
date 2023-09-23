import 'package:finalproject/models/category_model.dart';
import 'package:finalproject/screens/new%20inbox/tag_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../models/tag_model.dart';
import '../../providers/new_inbox_provider.dart';
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
  final String? selectedSender;
  final CategoryElement? selectedCategory;
  final List<TagElement>? selectedTags;
  NewInboxView(
      {super.key,
      this.selectedSender,
      this.selectedCategory,
      this.selectedTags});

  @override
  Widget build(BuildContext context) {
    // final tagStateNotifier = context.watch<TagStateNotifier>();

    final newInboxProvider =
        Provider.of<NewInboxProvider>(context, listen: false);
    // final senderController = newInboxProvider.senderController;
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
                doneFunction: () {},
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
                            TextEditingController(text: selectedSender)),
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
                        body: selectedTags == null
                            ? SizedBox()
                            : Wrap(
                                //كيف اخلي طول ال container على حسب ما يوسع عدد التاجز؟؟
                                runSpacing: 16,
                                spacing: 16,
                                children:
                                    selectedTags!.asMap().entries.map((entry) {
                                  final index = entry.key;
                                  final item = entry.value;
                                  return Container(
                                    height: 35,
                                    width: MediaQuery.of(context).size.width *
                                        0.23,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TagView()));
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
