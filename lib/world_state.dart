import 'entity.dart';
import 'player.dart';
import 'faction.dart';

class WorldState {
  final List<Entity> entities;
  final List<Player> players;
  final Map<String, int> playerProximityCounts;
  final Map<String, int> zoneClusterCounts; // Zone name -> Number of clusters
  final int largestClusterSize;
  final int groupCount;
  final double averageGroupSize;
  final Map<String, Faction> zoneControl; // Zone name -> Faction

  WorldState({
    required this.entities,
    required this.players,
    this.playerProximityCounts = const {},
    this.zoneClusterCounts = const {},
    this.largestClusterSize = 0,
    this.groupCount = 0,
    this.averageGroupSize = 0.0,
    this.zoneControl = const {},
  });

  Map<String, dynamic> toJson() {
    return {
      'entities': entities.map((e) => e.toJson()).toList(),
      'players': players.map((p) => p.toJson()).toList(),
      'playerProximityCounts': playerProximityCounts,
      'zoneClusterCounts': zoneClusterCounts,
      'largestClusterSize': largestClusterSize,
      'groupCount': groupCount,
      'averageGroupSize': averageGroupSize,
      'zoneControl': zoneControl.map((k, v) => MapEntry(k, v.toJson())),
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
      groupCount: json['groupCount'] as int? ?? 0,
      averageGroupSize: (json['averageGroupSize'] as num?)?.toDouble() ?? 0.0,
      zoneControl:
          (json['zoneControl'] as Map<String, dynamic>?)?.map(
            (k, v) => MapEntry(k, Faction.fromJson(v as String)),
          ) ??
          {},
    );
  }
}
