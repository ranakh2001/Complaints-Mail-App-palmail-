import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class DateArchiveContainer extends StatelessWidget {
  const DateArchiveContainer({
    super.key,
    required this.dateInputController,
  });

  final TextEditingController? dateInputController;

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
                      Container(
                        width: 100,
                        child: TextField(
                          controller: dateInputController,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText:
                                '${DateTime.now().month.toString()}/ ${DateTime.now().day}/ ${DateTime.now().year}',
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
                  )
                ],
              ),
            ),
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
    );
  }
}
