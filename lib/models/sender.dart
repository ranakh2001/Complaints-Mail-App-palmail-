
class Sender {
    int? id;
    String? name;
    String? mobile;
    String? address;
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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        category: json["category"] == null ? null : Category.fromMap(json["category"]),
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