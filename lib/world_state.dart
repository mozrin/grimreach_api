import 'entity.dart';
import 'player.dart';

class WorldState {
  final List<Entity> entities;
  final List<Player> players;

  WorldState({required this.entities, required this.players});

  Map<String, dynamic> toJson() {
    return {
      'entities': entities.map((e) => e.toJson()).toList(),
      'players': players.map((p) => p.toJson()).toList(),
    };
  }

  factory WorldState.fromJson(Map<String, dynamic> json) {
    return WorldState(
      entities: (json['entities'] as List)
          .map((e) => Entity.fromJson(e as Map<String, dynamic>))
          .toList(),
      players: (json['players'] as List)
          .map((p) => Player.fromJson(p as Map<String, dynamic>))
          .toList(),
    );
  }
}
