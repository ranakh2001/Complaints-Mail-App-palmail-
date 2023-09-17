import 'package:finalproject/models/categories.dart';
import 'package:finalproject/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../core/helpers/api_response.dart';
import '../../core/util/constants.dart';

class CategoriewContainer extends StatelessWidget {
  const CategoriewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.circular(30)),
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
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  CategoryElement category =
                      categoryProvider.categoryList.data![index];
                  return GestureDetector(
                    onTap: () {
                      categoryProvider.toggleCategory(category);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            category.name!,
                            style: TextStyle(color: ktitleBlack, fontSize: 16),
                          ),
                          category.isSelected
                              ? SvgPicture.asset(
                                  'assets/icons/selected.svg',
                                  width: 20,
                                  height: 20,
                                )
                              : const SizedBox()
                        ]),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                      color: kdividerColor,
                    ),
                itemCount: 4);
          },
        ));
  }
}
