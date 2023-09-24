// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User2 userFromJson(String str) => User2.fromJson(json.decode(str));

String userToJson(User2 data) => json.encode(data.toJson());

class User2 {
  UserClass? user;
  String? token;

  User2({
    this.user,
    this.token,
  });

  factory User2.fromJson(Map<String, dynamic> json) => User2(
    user: json["user"] == null ? null : UserClass.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "token": token,
  };
}

class UserClass {
  int? id;
  String? name;
  String? email;
  dynamic image;
  dynamic emailVerifiedAt;
  String? roleId;
  String? createdAt;
  String? updatedAt;
  Role? role;

  UserClass({
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

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    image: json["image"],
    emailVerifiedAt: json["email_verified_at"],
    roleId: json["role_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    role: json["role"] == null ? null : Role.fromJson(json["role"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "image": image,
    "email_verified_at": emailVerifiedAt,
    "role_id": roleId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "role": role?.toJson(),
  };
}

class Role {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Role({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
