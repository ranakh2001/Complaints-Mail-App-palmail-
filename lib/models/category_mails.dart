import 'dart:convert';

import 'mail.dart';

CategoryMails categoryMailsFromMap(String str) => CategoryMails.fromMap(json.decode(str));

String categoryMailsToMap(CategoryMails data) => json.encode(data.toMap());

class CategoryMails {
    List<Mail>? mails;

    CategoryMails({
        this.mails,
    });

    factory CategoryMails.fromMap(Map<String, dynamic> json) => CategoryMails(
        mails: json["mails"] == null ? [] : List<Mail>.from(json["mails"]!.map((x) => Mail.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "mails": mails == null ? [] : List<dynamic>.from(mails!.map((x) => x.toMap())),
    };
}
