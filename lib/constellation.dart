enum Constellation {
  wanderer,
  crown,
  serpent,
  forge;

  String toJson() => name;

  static Constellation fromJson(String json) => values.firstWhere(
    (e) => e.name == json,
    orElse: () => Constellation.wanderer,
  );
}
