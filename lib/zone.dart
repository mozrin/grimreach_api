enum Zone {
  safe,
  wilderness;

  String toJson() => name;
  static Zone fromJson(String json) =>
      Zone.values.firstWhere((e) => e.name == json);
}
