import 'zone.dart';
import 'entity_type.dart';
import 'faction.dart';

class Entity {
  final String id;
  final double x;
  final double y;
  final Zone zone;
  final EntityType type;
  final Faction faction;

  Entity({
    required this.id,
    required this.x,
    required this.y,
    required this.zone,
    required this.type,
    this.faction = Faction.neutral,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'x': x,
      'y': y,
      'zone': zone.toJson(),
      'type': type.toJson(),
      'faction': faction.toJson(),
    };
  }

  factory Entity.fromJson(Map<String, dynamic> json) {
    return Entity(
      id: json['id'] as String,
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      zone: Zone.fromJson(json['zone'] as String),
      type: EntityType.fromJson(json['type'] as String),
      faction: Faction.fromJson(json['faction'] as String? ?? 'neutral'),
    );
  }
}
