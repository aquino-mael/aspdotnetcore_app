import 'base_entity.dart';

class UserEntity extends BaseEntity {
  String accessToken;
  String name;
  String email;

  UserEntity({
    required String? id,
    required DateTime? createdAt,
    required DateTime? updatedAt,
    required this.accessToken,
    required this.name,
    required this.email,
  }) : super(id, createdAt, updatedAt);
}
