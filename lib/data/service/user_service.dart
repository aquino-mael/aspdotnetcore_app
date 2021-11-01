import '../../domain/dtos/user/user.dart';
import '../../domain/interfaces/services/services.dart';
import '../http/http.dart';

class UserService implements IUserService {
  final HttpClient client;
  final String url;

  UserService({required this.client, required this.url});

  @override
  Future<UserDtoCreateResult> createUser(UserDtoCreate userToCreate) async {
    try {
      final response = await client.request(
        url + "/users",
        HttpMethod.POST,
        body: userToCreate.toMap(),
      );

      return UserDtoCreateResult.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<bool> deleteUser(String id) async {
    try {
      final response = await client.request(
        url + "/users/$id",
        HttpMethod.DELETE,
        queryParameters: {
          "id": id,
        }
      );

      return response['success'];
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<UserDtoUpdateResult> updateUser(UserDtoUpdate userToUpdate) async {
    try {
      final response = await client.request(
        url + "/users",
        HttpMethod.PUT,
        body: userToUpdate.toMap(),
      );
      return UserDtoUpdateResult.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<List<UserDto>> getAll() async {
    try {
      final response = await client.request(url + "/users", HttpMethod.GET);

      return [];
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<UserDto> getUser(String id) async {
    try {
      final response = await client.request(
        url + "/$id",
        HttpMethod.GET,
      );

      final user = UserDto.fromJson(response);

      return user;
    } catch (e) {
      throw e;
    }
  }
}
