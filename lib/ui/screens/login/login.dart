import 'package:aspnetcore_app/ui/widget/widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);

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
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    ElevatedButton(
                      onPressed: () {},
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
