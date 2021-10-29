import '../../dtos/user/user.dart';

abstract class IUserService {
  Future<UserDto> login(String email);
  Future<UserDtoCreateResult> createUser(UserDtoCreate userToCreate);
  Future<UserDtoUpdateResult> updateUser(UserDtoUpdate userToUpdate);
  Future<bool> deleteUser(String id);
}
