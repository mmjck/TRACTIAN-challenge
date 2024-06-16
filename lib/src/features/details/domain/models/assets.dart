import 'package:tree_view_application/src/shared/domain/enums/enum.dart';

class Assets {
  final String id;

  final String name;
  final Status? status;
  final SensorType? sensorType;
  final String? locationId;
  final String? parentId;

  Assets({
    required this.id,
    required this.name,
    this.status,
    this.sensorType,
    this.locationId,
    this.parentId,
  });

  factory Assets.fromJson(Map<String, dynamic> json) {
    return Assets(
      id: json["id"] as String,
      name: json["name"] as String,
      locationId: json["locationId"] as String?,
      parentId: json["parentId"] as String?,
      sensorType: json["sensorType"] != null
          ? SensorType.parse(value: (json["sensorType"] as String))
          : null,
      status: json["status"] != null
          ? Status.parse(value: (json["status"] as String))
          : null,
    );
  }
}
