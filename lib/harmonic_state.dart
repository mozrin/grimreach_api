enum HarmonicState {
  resonance,
  discordance,
  amplification,
  nullState;

  String toJson() => name;

  static HarmonicState fromJson(String json) => values.firstWhere(
    (e) => e.name == json,
    orElse: () => HarmonicState.nullState,
  );
}
