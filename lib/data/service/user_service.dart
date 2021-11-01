import '../../domain/dtos/user/user.dart';
import '../../domain/interfaces/services/services.dart';
import '../http/http.dart';

class UserService implements IUserService {
  final HttpClient client;
  final String url;

  UserService(this.client, this.url);

  @override
  Future<UserDtoCreateResult> createUser(UserDtoCreate userToCreate) async {
    try {
      final response = await client.postAsync(url, userToCreate.toMap());
      return UserDtoCreateResult.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<bool> deleteUser(String id) async {
    try {
      final response = await client.deleteAsync(url, id);
      return response;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<UserDtoUpdateResult> updateUser(UserDtoUpdate userToUpdate) async {
    try {
      final response = await client.putAsync(url, userToUpdate.toMap());
      return UserDtoUpdateResult.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<List<UserDto>> getAll() async {
    try {
      final response = await client.getAsync(url);

      final users = <UserDto>[];

      return users;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<UserDto> getUser(String id) async {
    try {
      final response = await client.getAsync(url, queryParameters: {"id": id});

      final user = UserDto.fromJson(response);

      return user;
    } catch (e) {
      throw e;
    }
  }
}
