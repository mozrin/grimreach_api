class Entity {
  final String id;

  Entity({required this.id});

  Map<String, dynamic> toJson() {
    return {'id': id};
  }

  factory Entity.fromJson(Map<String, dynamic> json) {
    return Entity(id: json['id'] as String);
  }
}
