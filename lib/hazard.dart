enum Hazard {
  none,
  stormSurge,
  wildfire,
  toxicFog,
  quake;

  String toJson() => name;
  static Hazard fromJson(String json) => Hazard.values.firstWhere(
    (e) => e.name == json,
    orElse: () => Hazard.none,
  );
}
