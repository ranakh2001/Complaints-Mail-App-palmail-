import 'package:finalproject/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/date_archive.dart';

class DateArchiveContainer extends StatelessWidget {
  const DateArchiveContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateArchiveProvider = Provider.of<DateArchiveProvider>(context);

    return Container(
      height: 205,
      width: 378,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
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
                          width: 200, // Adjusted width
                          child: TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: '${dateArchiveProvider.dayName}, '
                                  '${dateArchiveProvider.selectedDate.day}/${dateArchiveProvider.selectedDate.month.toString()}/${dateArchiveProvider.selectedDate.year}',
                              hintStyle: TextStyle(
                                color: kinProgressStatus.withOpacity(0.8),
                                fontSize: 15,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.navigate_next_outlined,
                    size: 35,
                    color: ksecondaryColor,
                  ),
                  onPressed: () {
                    dateArchiveProvider.openDatePicker(context);
                  },
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.file_present_sharp,
                  color: Colors.blue.withOpacity(0.7),
                  size: 35,
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Archive Number',
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        showCursor: true,
                        controller: dateArchiveProvider.archiveController,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
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
