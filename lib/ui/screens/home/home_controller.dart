import 'dart:async';

import '../../../domain/dtos/user/user.dart';
import '../../../domain/interfaces/services/services.dart';

class HomeController {
  final IUserService userService;

  HomeController(this.userService);

  StreamController<List<UserDto>> users = StreamController<List<UserDto>>();

  Future<void> getAllUsers() async {
    final allUsers = await userService.getAll();
    users.add(allUsers);
  }

  Future<void> registerUser(UserDtoCreate user) async {
    await userService.createUser(user);

    getAllUsers();
  }
}
