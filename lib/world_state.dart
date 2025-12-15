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
  final Map<String, Map<Faction, double>>
  zoneInfluence; // Zone -> Faction -> Score
  final Set<String> recentShifts; // Zones that changed owner this tick
  final Map<Faction, double> factionMorale; // Faction -> Morale Score
  final Map<Faction, double>
  factionInfluenceModifiers; // Faction -> Gain Multiplier
  final Map<Faction, double>
  factionPressure; // Faction -> Pressure Score (Phase 025)
  final Map<String, String>
  zoneSaturation; // Zone -> Saturation State (Phase 026)

  WorldState({
    required this.entities,
    required this.players,
    this.playerProximityCounts = const {},
    this.zoneClusterCounts = const {},
    this.largestClusterSize = 0,
    this.groupCount = 0,
    this.averageGroupSize = 0.0,
    this.zoneControl = const {},
    this.zoneInfluence = const {},
    this.recentShifts = const {},
    this.factionMorale = const {},
    this.factionInfluenceModifiers = const {},
    this.factionPressure = const {},
    this.zoneSaturation = const {},
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
      'zoneInfluence': zoneInfluence.map(
        (k, v) => MapEntry(k, v.map((fk, fv) => MapEntry(fk.name, fv))),
      ),
      'recentShifts': recentShifts.toList(),
      'factionMorale': factionMorale.map((k, v) => MapEntry(k.name, v)),
      'factionInfluenceModifiers': factionInfluenceModifiers.map(
        (k, v) => MapEntry(k.name, v),
      ),
      'factionPressure': factionPressure.map((k, v) => MapEntry(k.name, v)),
      'zoneSaturation': zoneSaturation,
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
      zoneInfluence:
          (json['zoneInfluence'] as Map<String, dynamic>?)?.map(
            (k, v) => MapEntry(
              k,
              (v as Map<String, dynamic>).map(
                (fk, fv) =>
                    MapEntry(Faction.fromJson(fk), (fv as num).toDouble()),
              ),
            ),
          ) ??
          {},
      recentShifts: Set<String>.from(json['recentShifts'] ?? []),
      factionMorale:
          (json['factionMorale'] as Map<String, dynamic>?)?.map(
            (k, v) => MapEntry(Faction.fromJson(k), (v as num).toDouble()),
          ) ??
          {},
      factionInfluenceModifiers:
          (json['factionInfluenceModifiers'] as Map<String, dynamic>?)?.map(
            (k, v) => MapEntry(Faction.fromJson(k), (v as num).toDouble()),
          ) ??
          {},
      factionPressure:
          (json['factionPressure'] as Map<String, dynamic>?)?.map(
            (k, v) => MapEntry(Faction.fromJson(k), (v as num).toDouble()),
          ) ??
          {},
      zoneSaturation: Map<String, String>.from(json['zoneSaturation'] ?? {}),
    );
  }
}
