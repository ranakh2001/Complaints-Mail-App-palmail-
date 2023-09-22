import 'package:finalproject/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/helpers/api_response.dart';
import '../../core/util/constants.dart';
import '../../models/mail.dart';
import 'home_mails.dart';

class SearchList extends StatelessWidget {
  const SearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, searchProvider, child) {
        if (searchProvider.searchMails.status == Status.LOADING) {
          return Center(
            child: CircularProgressIndicator(
              color: kinProgressStatus,
            ),
          );
        } else if (searchProvider.searchMails.status == Status.ERROR) {
          return Center(
            child: Text('${searchProvider.searchMails.message}'),
          );
        }
        return ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              Mail mail = searchProvider.searchMails.data![index];
              return HomeMails(
                  singleMail: true,
                 mail: mail,);
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
            itemCount: searchProvider.searchMails.data!.length);
      },
    );
  }
}
