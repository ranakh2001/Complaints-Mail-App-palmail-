import 'package:easy_localization/easy_localization.dart';
import 'package:finalproject/models/tags.dart';
import 'package:finalproject/providers/tags_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/helpers/api_response.dart';
import '../../core/util/constants.dart';

class TagsContainer extends StatelessWidget {
  const TagsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TagProvider>(
      builder: (context, tagProvider, child) {
        if (tagProvider.tagsList.status == Status.LOADING) {
          return Center(
            child: CircularProgressIndicator(
              color: kinProgressStatus,
            ),
          );
        } else if (tagProvider.tagsList.status == Status.ERROR) {
          return Center(
            child: Text('${tagProvider.tagsList.message}'),
          );
        }
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: Text.rich(TextSpan(children: <WidgetSpan>[
            WidgetSpan(
                child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: ktagBackground,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "allTags".tr(),
                style: TextStyle(color: ktagColor, fontSize: 14),
              ),
            )),
            for (int i = 0; i < tagProvider.tagsList.data!.length; i++) ...{
              WidgetSpan(
                  child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: ktagBackground,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  tagProvider.tagsList.data![i].name!,
                  style: TextStyle(color: ktagColor, fontSize: 14),
                ),
              ))
            }
          ])),
        );
      },
    );
  }
}
