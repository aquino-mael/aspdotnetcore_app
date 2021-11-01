
import '../../../domain/dtos/login/login.dart';
import '../../../domain/interfaces/services/services.dart';
import '../../common/common.dart';
import '../../mixin/mixin.dart';
import '../home/home.dart';

class LoginController with NavigatorManager {
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

      return navigateTo(
        HomeScreen.routeName,
        removeOldRoutes: true,
      );
    } catch (e) {
      throw e;
    }
  }
}
