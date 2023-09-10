import 'package:finalproject/widgets/custom_expansion_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class DateArchiveContainer extends StatefulWidget {
  const DateArchiveContainer({
    super.key,
  });

  @override
  State<DateArchiveContainer> createState() => _DateArchiveContainerState();
}

DateTime selectedDate = DateTime.now();

class _DateArchiveContainerState extends State<DateArchiveContainer> {
  String dayName = DateFormat('EEEE').format(selectedDate);

  final DateTime firstDate = DateTime(2020, 1);

  final DateTime lastDate = DateTime(2100, 12);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 378,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        CupertinoIcons.calendar,
                        size: 30,
                        color: Colors.red.withOpacity(0.8),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Date',
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            width: 150,
                            child: TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: '${dayName}, '
                                    '${selectedDate.day}/${selectedDate.month.toString()}/${selectedDate.year}',

                                // '${DateTime.now().month.toString()}/ ${DateTime.now().day}/ ${DateTime.now().year}',
                                hintStyle: TextStyle(
                                    color: kinProgressStatus.withOpacity(0.5),
                                    fontSize: 15),
                                border: InputBorder.none,
                              ),
                              // onTap: () async {
                              //   DateTime? pickedDate =
                              //       await showDatePicker(
                              //     context: context,
                              //     initialDate: DateTime.now(),
                              //     firstDate: DateTime(1950),
                              //     lastDate: DateTime(2100),
                              //   );
                              //
                              //   if (pickedDate != null) {
                              //     String formattedDate =
                              //         DateFormat('yyyy-MM-dd')
                              //             .format(pickedDate);
                              //     setState(() {
                              //       dateInputController.text =
                              //           formattedDate;
                              //     });
                              //   }
                              // },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.navigate_next_outlined,
                        size: 35,
                        color: ksecondaryColor.withOpacity(0.6),
                      ),
                      onPressed: () {
                        _openDatePicker(context);
                      }),
                ],
              ),
            ),
            Divider(),
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
    );
  }

  Future<void> _openDatePicker(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor:
                Colors.red.withOpacity(0.5), // Change to your desired red color
            colorScheme: ColorScheme.light(
                primary: Colors.red
                    .withOpacity(0.8)), // Change to your desired red color
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    updateDateAndName(date!);
    print('Date: $date');
  }

  updateDateAndName(DateTime date) {
    if (date != null) {
      selectedDate = date;
      dayName = DateFormat('EEEE').format(date);
      setState(() {});
    }
  }
}
