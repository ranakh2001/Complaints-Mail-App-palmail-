class TagElement {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  TagElement({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  String formatAsString() {
    return 'Tag: $name'; // Custom formatting
  }

  factory TagElement.fromJson(Map<String, dynamic> json) => TagElement(
        id: json["id"],
        name: json["name"],
        createdAt:
            json["createdAt"], // Update this line to match the actual key
        updatedAt:
            json["updatedAt"], // Update this line to match the actual key
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createdAt": createdAt, // Update this line to match the actual key
        "updatedAt": updatedAt, // Update this line to match the actual key
      };
}
