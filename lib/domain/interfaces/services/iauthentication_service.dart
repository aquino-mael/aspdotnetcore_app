import '../../dtos/login/login.dart';
import '../../entities/entities.dart';

abstract class IAuthenticationService {
  Future<UserEntity> login(LoginDto email);
}
