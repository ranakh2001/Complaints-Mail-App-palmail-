// To parse this JSON data, do
//
//     final tags = tagsFromMap(jsonString);

import 'dart:convert';

Tags tagsFromMap(String str) => Tags.fromMap(json.decode(str));

String tagsToMap(Tags data) => json.encode(data.toMap());

class Tags {
    List<Tag>? tags;

    Tags({
        this.tags,
    });

    factory Tags.fromMap(Map<String, dynamic> json) => Tags(
        tags: json["tags"] == null ? [] : List<Tag>.from(json["tags"]!.map((x) => Tag.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x.toMap())),
    };
}

class Tag {
    int? id;
    String? name;
    DateTime? createdAt;
    DateTime? updatedAt;

    Tag({
        this.id,
        this.name,
        this.createdAt,
        this.updatedAt,
    });

    factory Tag.fromMap(Map<String, dynamic> json) => Tag(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
