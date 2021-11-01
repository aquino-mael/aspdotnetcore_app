
import '../../../domain/dtos/login/login.dart';
import '../../../domain/interfaces/services/services.dart';
import '../../common/common.dart';

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

      user = loginResult;
    } catch (e) {
      throw e;
    }
  }
}
