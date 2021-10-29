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
}
