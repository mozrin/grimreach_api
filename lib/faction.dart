enum Faction {
  neutral,
  order,
  chaos;

  String toJson() => name;
  static Faction fromJson(String json) =>
      values.firstWhere((e) => e.name == json, orElse: () => Faction.neutral);
}
