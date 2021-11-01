class UserDtoCreateResult {
  final String id;
  final String name;
  final String email;
  final DateTime createdAt;

  const UserDtoCreateResult({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
  });

  factory UserDtoCreateResult.fromJson(Map map) => UserDtoCreateResult(
    id: map['id'],
    name: map['name'],
    email: map['email'],
    createdAt: map['createdAt'],
  );
}
