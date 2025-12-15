import 'zone.dart';
import 'entity_type.dart';

class Entity {
  final String id;
  final Zone zone;
  final EntityType type;

  Entity({required this.id, this.zone = Zone.safe, this.type = EntityType.npc});

  Map<String, dynamic> toJson() {
    return {'id': id, 'zone': zone.toJson(), 'type': type.toJson()};
  }

  factory Entity.fromJson(Map<String, dynamic> json) {
    return Entity(
      id: json['id'] as String,
      zone: json['zone'] != null
          ? Zone.fromJson(json['zone'] as String)
          : Zone.safe,
      type: json['type'] != null
          ? EntityType.fromJson(json['type'] as String)
          : EntityType.npc,
    );
  }
}
