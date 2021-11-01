import '../../dtos/login/login.dart';

abstract class IAuthenticationService {
  Future<void> login(LoginDto email);
}
