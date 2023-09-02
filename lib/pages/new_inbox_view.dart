import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class NewInboxView extends StatefulWidget {
  TextEditingController? senderController;
  TextEditingController? titleController;
  TextEditingController? descriptionController;
  TextEditingController? addDecisionController;
  TextEditingController? addNewActivityController;
  TextEditingController? dateInputController;

  NewInboxView(
      {super.key,
      this.senderController,
      this.titleController,
      this.descriptionController,
      this.addNewActivityController,
      this.addDecisionController,
      this.dateInputController}) {
    senderController ??= TextEditingController();
    titleController ??= TextEditingController();
    descriptionController ??= TextEditingController();
    addDecisionController ??= TextEditingController();
    addNewActivityController ??= TextEditingController();
    dateInputController ??= TextEditingController();
  }

  @override
  State<NewInboxView> createState() => _NewInboxViewState();
}

class _NewInboxViewState extends State<NewInboxView> {
  @override
  void initState() {
    widget.senderController = TextEditingController();
    widget.titleController = TextEditingController();
    widget.descriptionController = TextEditingController();
    widget.addDecisionController = TextEditingController();
    widget.addNewActivityController = TextEditingController();
    widget.dateInputController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: ListView(children: [
        Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'cancel',
                      style: TextStyle(fontSize: 25, color: kinProgressStatus),
                    ),
                    Text(
                      'New Inbox',
                      style: TextStyle(fontSize: 25, color: ktitleBlack),
                    ),
                    Text(
                      'Done',
                      style: TextStyle(fontSize: 25, color: kinProgressStatus),
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
              child: Container(
                height: 140,
                width: 378,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: TextField(
                            autofocus: true,
                            controller: widget.senderController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Sender',
                                hintStyle: TextStyle(color: kiconColor),
                                prefix: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    CupertinoIcons.person,
                                    color: kiconColor,
                                  ),
                                ),
                                suffix: Icon(
                                  CupertinoIcons.info,
                                  size: 30,
                                  color: kinProgressStatus,
                                )),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Divider(),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Category',
                                style: TextStyle(fontSize: 20),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Other',
                                      style: TextStyle(
                                          color: ksecondaryColor, fontSize: 16),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.navigate_next,
                                          color: ksecondaryColor,
                                          size: 30,
                                        ),
                                        onPressed: () {},
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 130,
                width: 378,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.white),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12, top: 12),
                      child: TextField(
                        controller: widget.titleController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Title of mail',
                          hintStyle: TextStyle(color: kiconColor, fontSize: 26),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.0),
                      child: Divider(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 12,
                      ),
                      child: TextField(
                        autofocus: true,
                        controller: widget.descriptionController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Description',
                          hintStyle: TextStyle(color: kiconColor, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 140,
                width: 378,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: Icon(
                                  CupertinoIcons.calendar,
                                  size: 30,
                                  color: Colors.red.withOpacity(0.8),
                                ),
                                onPressed: () {},
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Date',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Expanded(
                                    child: TextField(
                                        controller: widget.dateInputController,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                            hintText:
                                                '${DateTime.now().month.toString()}/ ${DateTime.now().day}/ ${DateTime.now().year}',
                                            hintStyle: TextStyle(
                                                color: kinProgressStatus
                                                    .withOpacity(0.5),
                                                fontSize: 15),
                                            border: InputBorder.none),
                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1950),
                                                  //DateTime.now() - not to allow to choose before today.
                                                  lastDate: DateTime(2100));

                                          if (pickedDate != null) {
                                            print(
                                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                            String formattedDate =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(pickedDate);
                                            print(
                                                formattedDate); //formatted date output using intl package =>  2021-03-16
                                            setState(() {
                                              widget.dateInputController!.text =
                                                  formattedDate; //set output date to TextField value.
                                            });
                                          }
                                        }),
                                  )
                                ],
                              )
                            ],
                          )),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Divider(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.file_present_sharp,
                              color: kinProgressStatus.withOpacity(0.7),
                              size: 35,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Archive Number',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  '${DateTime.now().year} / archNum',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 60,
                width: 378,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.white),
                child: Padding(
                    padding: const EdgeInsets.all(12.0),
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
                            )
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.navigate_next,
                            size: 35,
                            color: ksecondaryColor,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    )),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Stack(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 60,
                  width: 378,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.white),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 35.0, top: 10),
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
                            borderRadius: BorderRadius.circular(40)),
                        child: const Center(
                            child: Text(
                          'Inbox',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      )
                    ],
                  )),
            ]),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 84,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35), color: Colors.white),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Decision', style: TextStyle(fontSize: 25)),
                    Expanded(
                      child: TextField(
                        controller: widget.addDecisionController,
                        decoration: const InputDecoration(
                            hintText: 'Add decision...',
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 60,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Add Image',
                  style: TextStyle(color: kinProgressStatus, fontSize: 22),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Activity',
                    style: TextStyle(fontSize: 25),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: kinProgressStatus.withOpacity(0.7),
                        size: 35,
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Stack(children: [
                Center(
                  child: Container(
                    height: 60,
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: kiconColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10),
                  child: TextField(
                      controller: widget.addNewActivityController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Add New Activity ...',
                          prefix: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 8,
                            child: Icon(
                              CupertinoIcons.person,
                              size: 12,
                            ),
                          ),
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          suffixIcon: Icon(
                            CupertinoIcons.location_fill,
                            color: Colors.blue.withOpacity(0.5),
                          ))),
                ),
              ]),
            )
          ],
        ),
      ]),
    );
  }
}
