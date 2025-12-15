import 'zone.dart';

class Entity {
  final String id;
  final Zone zone;

  Entity({required this.id, this.zone = Zone.safe});

  Map<String, dynamic> toJson() {
    return {'id': id, 'zone': zone.toJson()};
  }

  factory Entity.fromJson(Map<String, dynamic> json) {
    return Entity(
      id: json['id'] as String,
      zone: json['zone'] != null
          ? Zone.fromJson(json['zone'] as String)
          : Zone.safe,
    );
  }
}
