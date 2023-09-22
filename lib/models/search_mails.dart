// To parse this JSON data, do
//
//     final searchMails = searchMailsFromMap(jsonString);

import 'dart:convert';

import 'mail.dart';

SearchMails searchMailsFromMap(String str) => SearchMails.fromMap(json.decode(str));

String searchMailsToMap(SearchMails data) => json.encode(data.toMap());

class SearchMails {
    List<Mail>? mails;

    SearchMails({
        this.mails,
    });

    factory SearchMails.fromMap(Map<String, dynamic> json) => SearchMails(
        mails: json["mails"] == null ? [] : List<Mail>.from(json["mails"]!.map((x) => Mail.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "mails": mails == null ? [] : List<dynamic>.from(mails!.map((x) => x.toMap())),
    };
}