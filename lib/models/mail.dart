// To parse this JSON data, do
//
//     final mail = mailFromMap(jsonString);

import 'dart:convert';

Mail mailFromMap(String str) => Mail.fromMap(json.decode(str));

String mailToMap(Mail data) => json.encode(data.toMap());

class Mail {
  int? id;
  String? subject;
  dynamic description;
  String? senderId;
  String? archiveNumber;
  DateTime? archiveDate;
  dynamic decision;
  String? statusId;
  dynamic finalDecision;
  DateTime? createdAt;
  DateTime? updatedAt;
  Sender? sender;
  MStatus? status;
  List<dynamic>? attachments;
  List<dynamic>? activities;
  List<Tag>? tags;

  Mail({
    this.id,
    this.subject,
    this.description,
    this.senderId,
    this.archiveNumber,
    this.archiveDate,
    this.decision,
    this.statusId,
    this.finalDecision,
    this.createdAt,
    this.updatedAt,
    this.sender,
    this.status,
    this.attachments,
    this.activities,
    this.tags,
  });

  factory Mail.fromMap(Map<String, dynamic> json) => Mail(
        id: json["id"],
        subject: json["subject"],
        description: json["description"],
        senderId: json["sender_id"],
        archiveNumber: json["archive_number"],
        archiveDate: json["archive_date"] == null
            ? null
            : DateTime.parse(json["archive_date"]),
        decision: json["decision"],
        statusId: json["status_id"],
        finalDecision: json["final_decision"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        sender: json["sender"] == null ? null : Sender.fromMap(json["sender"]),
        status: json["status"] == null ? null : MStatus.fromMap(json["status"]),
        attachments: json["attachments"] == null
            ? []
            : List<dynamic>.from(json["attachments"]!.map((x) => x)),
        activities: json["activities"] == null
            ? []
            : List<dynamic>.from(json["activities"]!.map((x) => x)),
        tags: json["tags"] == null
            ? []
            : List<Tag>.from(json["tags"]!.map((x) => Tag.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "subject": subject,
        "description": description,
        "sender_id": senderId,
        "archive_number": archiveNumber,
        "archive_date": archiveDate?.toIso8601String(),
        "decision": decision,
        "status_id": statusId,
        "final_decision": finalDecision,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "sender": sender?.toMap(),
        "status": status?.toMap(),
        "attachments": attachments == null
            ? []
            : List<dynamic>.from(attachments!.map((x) => x)),
        "activities": activities == null
            ? []
            : List<dynamic>.from(activities!.map((x) => x)),
        "tags":
            tags == null ? [] : List<dynamic>.from(tags!.map((x) => x.toMap())),
      };
}

class Sender {
  int? id;
  String? name;
  String? mobile;
  dynamic address;
  String? categoryId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Category? category;

  Sender({
    this.id,
    this.name,
    this.mobile,
    this.address,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  factory Sender.fromMap(Map<String, dynamic> json) => Sender(
        id: json["id"],
        name: json["name"],
        mobile: json["mobile"],
        address: json["address"],
        categoryId: json["category_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        category: json["category"] == null
            ? null
            : Category.fromMap(json["category"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "mobile": mobile,
        "address": address,
        "category_id": categoryId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "category": category?.toMap(),
      };
}

class Category {
  int? id;
  String? name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}

class MStatus {
  int? id;
  String? name;
  String? color;

  MStatus({
    this.id,
    this.name,
    this.color,
  });

  factory MStatus.fromMap(Map<String, dynamic> json) => MStatus(
        id: json["id"],
        name: json["name"],
        color: json["color"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "color": color,
      };
}

class Tag {
  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  Pivot? pivot;

  Tag({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory Tag.fromMap(Map<String, dynamic> json) => Tag(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        pivot: json["pivot"] == null ? null : Pivot.fromMap(json["pivot"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pivot": pivot?.toMap(),
      };
}

class Pivot {
  String? mailId;
  String? tagId;

  Pivot({
    this.mailId,
    this.tagId,
  });

  factory Pivot.fromMap(Map<String, dynamic> json) => Pivot(
        mailId: json["mail_id"],
        tagId: json["tag_id"],
      );

  Map<String, dynamic> toMap() => {
        "mail_id": mailId,
        "tag_id": tagId,
      };
}
