import 'package:flutter/material.dart';

import '../../mixin/mixin.dart';
import '../../widget/widget.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget with KeyboardManager {
  static const String routeName = "/";

  final LoginController loginController;
  
  LoginScreen({
    Key? key,
    required this.loginController,
  }) : super(key: key);

  final TextEditingController _emailInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(context),
      child: Scaffold(
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
                        onChanged: (value) {
                          loginController.email = value;
                        }
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          hideKeyboard(context);
                          loginController.auth();
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
      ),
    );
  }
}
