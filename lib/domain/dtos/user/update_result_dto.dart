class UserDtoUpdateResult {
  final String id;
  final String name;
  final String email;
  final DateTime updatedAt;

  const UserDtoUpdateResult({
    required this.id,
    required this.name,
    required this.email,
    required this.updatedAt,
  });

  factory UserDtoUpdateResult.fromJson(Map map) => UserDtoUpdateResult(
    id: map['id'],
    name: map['name'],
    email: map['email'],
    updatedAt: DateTime.parse(map['updatedAt']).toLocal(),
  );
}
