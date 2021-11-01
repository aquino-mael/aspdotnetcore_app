import '../../../domain/dtos/login/login.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/interfaces/services/services.dart';

class LoginController {
  final IAuthenticationService service;

  LoginController(this.service);

  String email = '';

  Future<void> auth() async {
    try {
      final loginResult = await service.login(
        LoginDto(
          email: email,
        ),
      );

      _saveEntity(loginResult);
    } catch (e) {
      throw e;
    }
  }

  void _saveEntity(UserEntity entity) {

  }
}
