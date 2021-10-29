import 'base_entity.dart';

class UserEntity extends BaseEntity {
  String name;
  String email;

  UserEntity({
    required this.name,
    required this.email,
  });
}
