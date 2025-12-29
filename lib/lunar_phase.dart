enum LunarPhase {
  newMoon,
  waxing,
  fullMoon,
  waning;

  String toJson() => name;

  static LunarPhase fromJson(String json) => values.firstWhere(
    (e) => e.name == json,
    orElse: () => LunarPhase.newMoon,
  );
}
