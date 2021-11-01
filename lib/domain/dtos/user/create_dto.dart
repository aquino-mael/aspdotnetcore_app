class UserDtoCreate {
  final String name;
  final String email;

  UserDtoCreate({
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toMap() => {
    "name": name,
    "email": email,
  };
}
