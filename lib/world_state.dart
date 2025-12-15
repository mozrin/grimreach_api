import 'entity.dart';
import 'player.dart';

class WorldState {
  final List<Entity> entities;
  final List<Player> players;
  final Map<String, int> playerProximityCounts;
  final Map<String, int> zoneClusterCounts; // Zone name -> Number of clusters
  final int largestClusterSize;

  WorldState({
    required this.entities,
    required this.players,
    this.playerProximityCounts = const {},
    this.zoneClusterCounts = const {},
    this.largestClusterSize = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'entities': entities.map((e) => e.toJson()).toList(),
      'players': players.map((p) => p.toJson()).toList(),
      'playerProximityCounts': playerProximityCounts,
      'zoneClusterCounts': zoneClusterCounts,
      'largestClusterSize': largestClusterSize,
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
      playerProximityCounts: Map<String, int>.from(
        json['playerProximityCounts'] ?? {},
      ),
      zoneClusterCounts: Map<String, int>.from(json['zoneClusterCounts'] ?? {}),
      largestClusterSize: json['largestClusterSize'] as int? ?? 0,
    );
  }
}
