import 'zone.dart';

class Player {
  final String id;
  final double x;
  final double y;
  final Zone zone;

  Player({
    required this.id,
    required this.x,
    required this.y,
    this.zone = Zone.safe,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'x': x,
    'y': y,
    'zone': zone.toJson(),
  };

  factory Player.fromJson(Map<String, dynamic> json) => Player(
    id: json['id'] as String,
    x: (json['x'] as num).toDouble(),
    y: (json['y'] as num).toDouble(),
    zone: json['zone'] != null
        ? Zone.fromJson(json['zone'] as String)
        : Zone.safe,
  );
}
