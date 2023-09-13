import 'package:finalproject/core/util/constants.dart';
import 'package:finalproject/providers/mail_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:provider/provider.dart';

import 'custom_expansion_tile.dart';

class DatePickerContainer extends StatelessWidget {
  const DatePickerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(30)),
      child: CustomExpansionTile(
          title: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/calender.svg',
                width: 30,
                height: 30,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Date',
                    style: TextStyle(color: ktitleBlack, fontSize: 16),
                  ),
                  Row(
                    children: [
                      Text(
                        'From:',
                        style: TextStyle(color: ksecondaryColor, fontSize: 12),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'July 5, 2022',
                        style:
                            TextStyle(color: kinProgressStatus, fontSize: 12),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        'To:',
                        style: TextStyle(color: ksecondaryColor, fontSize: 12),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'July 5, 2022',
                        style:
                            TextStyle(color: kinProgressStatus, fontSize: 12),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          body: CalendarDatePicker2(
            config: CalendarDatePicker2Config(
                selectedDayHighlightColor: kinProgressStatus,
                selectedRangeHighlightColor: kinProgressStatus),
            value: Provider.of<MailFilterProvider>(context).dates,
            onValueChanged: (dates) {
              print(dates);
            },
          )),
    );
  }
}
