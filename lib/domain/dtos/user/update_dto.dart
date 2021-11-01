class UserDtoUpdate {
  String id;
  String name;
  String email;

  UserDtoUpdate({
    required this.id,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "email": email,
  };
}
