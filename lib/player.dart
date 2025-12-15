import 'zone.dart';
import 'faction.dart';

class Player {
  final String id;
  final double x;
  final double y;
  final Zone zone;
  final Faction faction;

  Player({
    required this.id,
    required this.x,
    required this.y,
    required this.zone,
    this.faction = Faction.neutral,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'x': x,
      'y': y,
      'zone': zone.toJson(),
      'faction': faction.toJson(),
    };
  }

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'] as String,
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      zone: Zone.fromJson(json['zone'] as String),
      faction: Faction.fromJson(json['faction'] as String? ?? 'neutral'),
    );
  }
}
