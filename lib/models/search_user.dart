class User {
    int? id;
    String? name;
    String? email;
    String? image;
    dynamic emailVerifiedAt;
    String? roleId;
    DateTime? createdAt;
    DateTime? updatedAt;
    UserCategory? role;

    User({
        this.id,
        this.name,
        this.email,
        this.image,
        this.emailVerifiedAt,
        this.roleId,
        this.createdAt,
        this.updatedAt,
        this.role,
    });

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        image: json["image"],
        emailVerifiedAt: json["email_verified_at"],
        roleId: json["role_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        role: json["role"] == null ? null : UserCategory.fromMap(json["role"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "image": image,
        "email_verified_at": emailVerifiedAt,
        "role_id": roleId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "role": role?.toMap(),
    };
}

class UserCategory {
    int? id;
    String? name;
    DateTime? createdAt;
    DateTime? updatedAt;

    UserCategory({
        this.id,
        this.name,
        this.createdAt,
        this.updatedAt,
    });

    factory UserCategory.fromMap(Map<String, dynamic> json) => UserCategory(
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


