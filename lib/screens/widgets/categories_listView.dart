import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/helpers/api_response.dart';
import '../../core/util/constants.dart';
import '../../models/category.dart';
import '../../providers/category_provider.dart';
import 'custom_expansion_tile.dart';
import 'mail_container.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Consumer<CategoriesProvider>(
          builder: (context, categoryProvider, child) {
            if (categoryProvider.categoryList.status == Status.LOADING) {
              return Center(
                child: CircularProgressIndicator(
                  color: kinProgressStatus,
                ),
              );
            } else if (categoryProvider.categoryList.status == Status.ERROR) {
              return Center(
                child: Text('${categoryProvider.categoryList.message}'),
              );
            }
            return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  CategoryElement category =
                      categoryProvider.categoryList.data![index];
                  return CustomExpansionTile(
                    body: const MailContainer(),
                    title: Text(
                      category.name!.tr(),
                      style: TextStyle(color: ktitleBlack, fontSize: 20),
                    ),
                    numOfMails: 12,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                itemCount: categoryProvider.categoryList.data!.length);
          },
        ));
  }
}
