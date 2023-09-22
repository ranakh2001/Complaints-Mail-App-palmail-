import 'mail.dart';

class Statuses {
  List<MailStatus>? statuses;

  Statuses({this.statuses});

  Statuses.fromJson(Map<String, dynamic> json) {
    if (json['statuses'] != null) {
      statuses = <MailStatus>[];
      json['statuses'].forEach((v) {
        statuses!.add(MailStatus.fromMap(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (statuses != null) {
      data['statuses'] = statuses!.map((v) => v.toMap()).toList();
    }
    return data;
  }
}

class MailStatus {
  int? id;
  String? name;
  String? color;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? mailsCount;
  List<Mail>? mails;
  bool isSelected = false;

  MailStatus({
    this.id,
    this.name,
    this.color,
    this.createdAt,
    this.updatedAt,
    this.mailsCount,
    this.mails,
  });

  factory MailStatus.fromMap(Map<String, dynamic> json) => MailStatus(
        id: json["id"],
        name: json["name"],
        color: json["color"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        mailsCount: json["mails_count"],
        mails: json["mails"] == null
            ? []
            : List<Mail>.from(json["mails"]!.map((x) => Mail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "color": color,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "mails_count": mailsCount,
        "mails": mails == null
            ? []
            : List<dynamic>.from(mails!.map((x) => x.toMap())),
      };
}
