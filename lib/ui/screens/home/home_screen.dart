import 'package:flutter/material.dart';

import '../../../domain/dtos/user/user.dart';
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

class _HomeScreenState extends State<HomeScreen> {
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
              _controller.registerUser(
                UserDtoCreate(
                  email: "ismael@hotmail.com",
                  name: "Ismael Aquino Teste",
                )
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<List<UserDto>>(
        stream: _controller.users.stream,
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

  Widget _buildUsersList(UserDto user) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
    );
  }
}
