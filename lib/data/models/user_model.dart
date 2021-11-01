import 'package:aspnetcore_app/domain/entities/entities.dart';

class UserModel {
  bool authenticated;
  DateTime created;
  DateTime expiration;
  String accessToken;
  String username;
  String name;
  String message;

  UserModel({
    required this.authenticated,
    required this.created,
    required this.expiration,
    required this.accessToken,
    required this.username,
    required this.name,
    required this.message,
  });

  factory UserModel.fromJson(Map json) {
    return UserModel(
      authenticated: json['authenticated'],
      created: _parseStringToDateTime(json['created']),
      expiration: _parseStringToDateTime(json['expiration']),
      accessToken: json['accessToken'],
      username: json['username'],
      name: json['name'],
      message: json['message'],
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      authenticated: authenticated,
      created: created,
      expiration: expiration,
      accessToken: accessToken,
      username: username,
      name: name,
      message: message,
    );
  }

  static DateTime _parseStringToDateTime(String value) => DateTime.parse(value).toLocal();
}
