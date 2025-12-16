enum Season {
  spring,
  summer,
  autumn,
  winter;

  String toJson() => name;

  static Season fromJson(String json) =>
      values.firstWhere((e) => e.name == json, orElse: () => Season.spring);
}
