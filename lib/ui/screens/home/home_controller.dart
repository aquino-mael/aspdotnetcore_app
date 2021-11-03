import 'dart:async';

import '../../../domain/dtos/user/user.dart';
import '../../../domain/interfaces/services/services.dart';

class HomeController {
  final IUserService userService;

  HomeController(this.userService);

  StreamController<List<UserDto>> usersStreamController = StreamController<List<UserDto>>();

  List<UserDto> users = <UserDto>[];

  Future<void> getAllUsers() async {
    users = await userService.getAll();
    usersStreamController.add(users);
  }

  Future<void> registerUser(UserDtoCreate user) async {
    final createResult = await userService.createUser(user);

    users.add(
      UserDto(
        id: createResult.id,
        name: createResult.name,
        email: createResult.email,
        createdAt: createResult.createdAt,
      ),
    );
  }

  Future<void> updateUser(UserDtoUpdate user) async {
    final createResult = await userService.updateUser(user);

    var currentUser = users.firstWhere((element) => element.id == user.id);

    users.removeWhere((element) => element.id == currentUser.id);

    users.add(
      UserDto(
        id: createResult.id,
        name: createResult.name,
        email: createResult.email,
        createdAt: currentUser.createdAt,
      ),
    );
  }

  Future<bool> deleteUser(String id) async {
    final deleteResult = await userService.deleteUser(id);

    if(deleteResult)
      users.removeWhere((element) => element.id == id);

    return deleteResult;
  }
}
