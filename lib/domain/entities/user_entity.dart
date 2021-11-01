class UserEntity {
  bool authenticated;
  DateTime created;
  DateTime expiration;
  String accessToken;
  String username;
  String name;
  String message;

  UserEntity({
    required this.authenticated,
    required this.created,
    required this.expiration,
    required this.accessToken,
    required this.username,
    required this.name,
    required this.message,
  });
}
