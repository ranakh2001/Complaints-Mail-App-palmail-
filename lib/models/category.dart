// To parse this JSON data, do
//
//     final categories = categoriesFromMap(jsonString);

import 'dart:convert';

Categories categoriesFromMap(String str) =>
    Categories.fromMap(json.decode(str));

String categoriesToMap(Categories data) => json.encode(data.toMap());

class Categories {
  List<CategoryElement>? categories;

  Categories({
    this.categories,
  });

  factory Categories.fromMap(Map<String, dynamic> json) => Categories(
        categories: json["categories"] == null
            ? []
            : List<CategoryElement>.from(
                json["categories"]!.map((x) => CategoryElement.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toMap())),
      };
}

class CategoryElement {
  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? sendersCount;
  List<Sender>? senders;
  bool isSelected = false;

  CategoryElement({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.sendersCount,
    this.senders,
  });

  factory CategoryElement.fromMap(Map<String, dynamic> json) => CategoryElement(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        sendersCount: json["senders_count"],
        senders: json["senders"] == null
            ? []
            : List<Sender>.from(json["senders"]!.map((x) => Sender.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "senders_count": sendersCount,
        "senders": senders == null
            ? []
            : List<dynamic>.from(senders!.map((x) => x.toMap())),
      };
}

class Sender {
  int? id;
  String? name;
  String? mobile;
  String? address;
  String? categoryId;
  DateTime? createdAt;
  DateTime? updatedAt;
  SenderCategory? category;

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
            : SenderCategory.fromMap(json["category"]),
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

class SenderCategory {
  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;

  SenderCategory({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory SenderCategory.fromMap(Map<String, dynamic> json) => SenderCategory(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
