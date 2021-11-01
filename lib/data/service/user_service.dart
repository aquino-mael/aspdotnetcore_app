import '../../domain/dtos/user/user.dart';
import '../../domain/interfaces/services/services.dart';
import '../../ui/common/common.dart';
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
        headers: {
          "authorization": user!.accessToken,
        },
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
        headers: {
          "authorization": user!.accessToken,
        },
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
        headers: {
          "authorization": user!.accessToken,
        },
      );

      return UserDtoUpdateResult.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<List<UserDto>> getAll() async {
    try {
      final response = await client.request(
        url + "/users",
        HttpMethod.GET,
        headers: {
          "authorization": user!.accessToken,
        },
      );

      return response['data'].map<UserDto>((item) => UserDto.fromJson(item)).toList();
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
        headers: {
          "authorization": user!.accessToken,
        },
      );

      final userDto = UserDto.fromJson(response);

      return userDto;
    } catch (e) {
      throw e;
    }
  }
}
