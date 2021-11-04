import 'package:flutter/material.dart';

import '../../../domain/dtos/user/user.dart';
import '../../common/common.dart';
import '../../mixin/mixin.dart';
import '../../widget/widget.dart';
import '../screens.dart';
import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";

  final HomeController controller;

  const HomeScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with NavigatorManager {
  HomeController get _controller => widget.controller;

  @override
  void initState() {
    super.initState();
    _controller.getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user!.name
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh
            ),
            onPressed: _controller.getAllUsers,
          ),
          IconButton(
            icon: Icon(
              Icons.person_add_alt_1
            ),
            onPressed: () async {
              Map<String, dynamic> newUser = await _openDialogToAddUser();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Adicionando novo usuário..."),
                )
              );

              await _controller.registerUser(
                UserDtoCreate(
                  email: newUser["email"]!,
                  name: newUser["name"]!,
                )
              );

              await _controller.getAllUsers();

              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Novo usuário criado com sucesso!"),
                )
              );
            },
          ),

          IconButton(
            icon: Icon(
              Icons.logout,
            ),
            onPressed: () async {
              return logout();
            },
          ),
        ],
      ),
      body: StreamBuilder<List<UserDto>>(
        stream: _controller.usersStreamController.stream,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView(
            children: snapshot.data!.map(_buildUsersList).toList(),
          );
        }
      ),
    );
  }

  Widget _buildUsersList(UserDto userDto) {
    return ListTile(
      title: Text(
        userDto.name
      ),
      subtitle: Text(
        userDto.email
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              Icons.edit,
            ),
            onPressed: () async {
              Map<String, dynamic> edited = await _openDialogToAddUser(
                "Atualizar usuário",
                userDto.name,
                userDto.email
              );

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Atualizando usuário..."),
                )
              );
              
              await _controller.updateUser(
                UserDtoUpdate(
                  id: userDto.id,
                  email: edited["email"],
                  name: edited["name"],
                )
              );

              if(userDto.name == user!.name) {
                return logout();
              }

              await _controller.getAllUsers();

              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Usuário atualizado com sucesso!"),
                )
              );
            }
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () async {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Deletando ${userDto.name}..."),
                )
              );

              var deleted = await _controller.deleteUser(userDto.id);

              ScaffoldMessenger.of(context).removeCurrentSnackBar();

              if(deleted) {
                await _controller.getAllUsers();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${userDto.name} Deletado!"),
                  )
                );
              }
              else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Falha ao deletar ${userDto.name}."),
                  )
                );
              }
            }
          ),
        ],
      ),
    );
  }

  Future<Map<String, String?>> _openDialogToAddUser([
    String title = "Adicionar usuário",
    String? name,
    String? email,
  ]) async {
    Map<String, String?> userInfos = {
      "email": email,
      "name": name,
    };

    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
          padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                InputField(
                  label: "Email",
                  initialValue: email,
                  onChanged: (value) {
                    userInfos["email"] = value;
                  },
                ),
                InputField(
                  label: "Name",
                  initialValue: name,
                  onChanged: (value) {
                    userInfos["name"] = value;
                  },
                ),
              ],
            ),
          ),
        );
      },
    );

    return userInfos;
  }
}
