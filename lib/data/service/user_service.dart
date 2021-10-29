import '../../domain/dtos/user/user.dart';
import '../../domain/interfaces/services/services.dart';

class UserService implements IUserService {
  @override
  Future<UserDtoCreateResult> createUser(UserDtoCreate userToCreate) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteUser(String id) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<UserDto> login(String email) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<UserDtoUpdateResult> updateUser(UserDtoUpdate userToUpdate) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
