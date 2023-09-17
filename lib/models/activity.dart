import 'package:finalproject/models/search_user.dart';

class Activity {
    int? id;
    String? body;
    String? userId;
    String? mailId;
    dynamic sendNumber;
    dynamic sendDate;
    dynamic sendDestination;
    DateTime? createdAt;
    DateTime? updatedAt;
    User? user;

    Activity({
        this.id,
        this.body,
        this.userId,
        this.mailId,
        this.sendNumber,
        this.sendDate,
        this.sendDestination,
        this.createdAt,
        this.updatedAt,
        this.user,
    });

    factory Activity.fromMap(Map<String, dynamic> json) => Activity(
        id: json["id"],
        body: json["body"],
        userId: json["user_id"],
        mailId: json["mail_id"],
        sendNumber: json["send_number"],
        sendDate: json["send_date"],
        sendDestination: json["send_destination"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        user: json["user"] == null ? null : User.fromMap(json["user"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "body": body,
        "user_id": userId,
        "mail_id": mailId,
        "send_number": sendNumber,
        "send_date": sendDate,
        "send_destination": sendDestination,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toMap(),
    };
}