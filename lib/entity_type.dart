enum EntityType {
  npc,
  resource,
  structure;

  String toJson() => name;

  static EntityType fromJson(String json) {
    return EntityType.values.firstWhere(
      (e) => e.name == json,
      orElse: () => EntityType.npc,
    );
  }
}
