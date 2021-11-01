class UserDto {
  final String id;
  final String name;
  final String email;
  final DateTime createdAt;

  UserDto({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
  });

  factory UserDto.fromJson(Map map) => UserDto(
    id: map["id"],
    name: map["name"],
    email: map["email"],
    createdAt: map["createdAt"],
  );
}
