class Location {
  final String name;
  final String? parentId;
  final String id;

  Location({
    required this.name,
    this.parentId,
    required this.id,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json["id"] as String,
      name: json["name"] as String,
      parentId: json["parentId"] as String?,
    );
  }
}
