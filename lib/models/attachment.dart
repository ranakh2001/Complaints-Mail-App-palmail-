class Attachment {
    int? id;
    String? title;
    String? image;
    String? mailId;
    DateTime? createdAt;
    DateTime? updatedAt;

    Attachment({
        this.id,
        this.title,
        this.image,
        this.mailId,
        this.createdAt,
        this.updatedAt,
    });

    factory Attachment.fromMap(Map<String, dynamic> json) => Attachment(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        mailId: json["mail_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "image": image,
        "mail_id": mailId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}