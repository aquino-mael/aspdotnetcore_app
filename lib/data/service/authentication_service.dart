import 'package:aspnetcore_app/data/models/models.dart';

import '../../domain/dtos/login/login.dart';
import '../../domain/entities/entities.dart';
import '../../domain/interfaces/services/services.dart';
import '../http/http.dart';

class AuthenticationService implements IAuthenticationService {
  HttpClient client;
  String url;

  AuthenticationService({
    required this.client,
    required this.url,
  });

  @override
  Future<UserEntity> login(LoginDto loginDto) async {
    try {
      final response = await client.request(
        url + "/login",
        HttpMethod.POST,
        body: {
          "email": loginDto.email,
        },
      );

      return UserModel.fromJson(response).toEntity();
    } catch (e) {
      throw e;
    }
  }
}
