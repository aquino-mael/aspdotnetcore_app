import 'package:aspnetcore_app/domain/dtos/login/login_dto.dart';
import 'package:flutter/material.dart';

import '../../../domain/interfaces/services/services.dart';
import '../../widget/widget.dart';

class LoginScreen extends StatelessWidget {
  final IAuthenticationService authenticationService;
  
  LoginScreen({
    Key? key,
    required this.authenticationService,
  }) : super(key: key);

  final TextEditingController _emailInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.circular(4.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Acessar",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    InputField(
                      label: "E-mail",
                      controller: _emailInputController,
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        authenticationService.login(
                          LoginDto(
                            email: _emailInputController.text,
                          ),
                        );
                      },
                      child: Text("Go"),
                    ),
                  ],
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}
