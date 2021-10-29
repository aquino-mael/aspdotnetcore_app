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
}
