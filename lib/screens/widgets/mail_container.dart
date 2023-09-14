import 'package:finalproject/core/util/constants.dart';
import 'package:finalproject/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/helpers/api_response.dart';
import '../../models/mail.dart';
import '../../screens/home/mail_details_screen.dart';
import 'home_mails.dart';

class MailContainer extends StatelessWidget {
  const MailContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Consumer<CategoriesProvider>(
          builder: (context, categoryProvider, child) {
            if (categoryProvider.categoryMailList.status == Status.LOADING) {
              return Center(
                child: CircularProgressIndicator(
                  color: kinProgressStatus,
                ),
              );
            } else if (categoryProvider.categoryMailList.status ==
                Status.ERROR) {
              return Center(
                child: Text('${categoryProvider.categoryMailList.message}'),
              );
            }
            List<Mail> categoryMails = categoryProvider.categoryMailList.data!;
            return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Mail mail = categoryMails[index];
                  return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, MailDetailsScreen.id);
                      },
                      child: HomeMails(
                        singleMail:
                            categoryProvider.categoryList.data!.length >= 2
                                ? false
                                : true,
                        organization: mail.sender!.category!.name!,
                        color: mail.status!.color!,
                        date: mail.createdAt!,
                        description: mail.description ?? '',
                        subject: mail.subject!,
                      ));
                },
                separatorBuilder: (context, index) => Padding(
                      padding:
                          const EdgeInsetsDirectional.symmetric(horizontal: 16),
                      child: Divider(
                        color: kiconColor,
                      ),
                    ),
                itemCount: categoryMails.length);
          },
        ));
  }
}
