import 'zone.dart';
import 'entity_type.dart';

class Entity {
  final String id;
  final double x;
  final double y;
  final Zone zone;
  final EntityType type;

  Entity({
    required this.id,
    required this.x,
    required this.y,
    this.zone = Zone.safe,
    this.type = EntityType.npc,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'x': x,
      'y': y,
      'zone': zone.toJson(),
      'type': type.toJson(),
    };
  }

  factory Entity.fromJson(Map<String, dynamic> json) {
    return Entity(
      id: json['id'] as String,
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      zone: json['zone'] != null
          ? Zone.fromJson(json['zone'] as String)
          : Zone.safe,
      type: json['type'] != null
          ? EntityType.fromJson(json['type'] as String)
          : EntityType.npc,
    );
  }
}
