import 'entity.dart';
import 'player.dart';
import 'faction.dart';
import 'season.dart';
import 'lunar_phase.dart';

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
  final Map<String, double>
  migrationPressure; // Zone -> Migration Pressure (Phase 027)
  final String globalEnvironment; // (Phase 028)
  final Map<String, String> zoneHazards; // Zone -> Hazard (Phase 029)
  final Season currentSeason; // (Phase 030)
  final List<String> seasonalModifiers; // (Phase 030)
  final LunarPhase currentLunarPhase; // (Phase 031)
  final List<String> lunarModifiers; // (Phase 031)

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
    this.migrationPressure = const {},
    this.globalEnvironment = 'calm',
    this.zoneHazards = const {},
    this.currentSeason = Season.spring,
    this.seasonalModifiers = const [],
    this.currentLunarPhase = LunarPhase.newMoon,
    this.lunarModifiers = const [],
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
      'migrationPressure': migrationPressure,
      'globalEnvironment': globalEnvironment,
      'zoneHazards': zoneHazards,
      'currentSeason': currentSeason.toJson(),
      'seasonalModifiers': seasonalModifiers,
      'currentLunarPhase': currentLunarPhase.toJson(),
      'lunarModifiers': lunarModifiers,
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
      migrationPressure:
          (json['migrationPressure'] as Map<String, dynamic>?)?.map(
            (k, v) => MapEntry(k, (v as num).toDouble()),
          ) ??
          {},
      globalEnvironment: json['globalEnvironment'] as String? ?? 'calm',
      zoneHazards: Map<String, String>.from(json['zoneHazards'] ?? {}),
      currentSeason: Season.fromJson(
        json['currentSeason'] as String? ?? 'spring',
      ),
      seasonalModifiers: List<String>.from(json['seasonalModifiers'] ?? []),
      currentLunarPhase: LunarPhase.fromJson(
        json['currentLunarPhase'] as String? ?? 'newMoon',
      ),
      lunarModifiers: List<String>.from(json['lunarModifiers'] ?? []),
    );
  }
}
