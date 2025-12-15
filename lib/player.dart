class Player {
  final String id;
  final double x;
  final double y;

  Player({required this.id, required this.x, required this.y});

  Map<String, dynamic> toJson() {
    return {'id': id, 'x': x, 'y': y};
  }

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'] as String,
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
    );
  }
}
