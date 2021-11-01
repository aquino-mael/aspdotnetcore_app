import '../../dtos/user/user.dart';

abstract class IUserService {
  Future<List<UserDto>> getAll();
  Future<UserDto> getUser(String id);
  Future<UserDtoCreateResult> createUser(UserDtoCreate userToCreate);
  Future<UserDtoUpdateResult> updateUser(UserDtoUpdate userToUpdate);
  Future<bool> deleteUser(String id);
}
