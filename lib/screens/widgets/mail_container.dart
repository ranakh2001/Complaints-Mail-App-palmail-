import 'package:finalproject/core/util/constants.dart';
import 'package:finalproject/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/mail.dart';
import 'home_mails.dart';

class MailContainer extends StatelessWidget {
  final int categoryId;
  const MailContainer({
    super.key,
    required this.categoryId,
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
            return FutureBuilder(
              future: categoryProvider.getCategoryMails(categoryId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: kinProgressStatus,
                    ),
                  );
                } else if (snapshot.hasData) {
                  return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Mail mail = snapshot.data![index];
                        return HomeMails(
                          singleMail:
                              categoryProvider.categoryList.data!.length >= 2
                                  ? false
                                  : true,
                          mail: mail,
                        );
                      },
                      separatorBuilder: (context, index) => Padding(
                            padding: const EdgeInsetsDirectional.symmetric(
                                horizontal: 16),
                            child: Divider(
                              color: kiconColor,
                            ),
                          ),
                      itemCount: snapshot.data!.length);
                }
                return const Text("No Data");
              },
            );
          },
        ));
  }
}
