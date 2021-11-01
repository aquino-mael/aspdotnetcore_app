import '../../domain/interfaces/services/services.dart';
import 'package:flutter/material.dart';

import '../screens/screens.dart';

class AspDotNetCoreApp extends StatelessWidget {
  final IAuthenticationService authenticationService;

  const AspDotNetCoreApp({
    required this.authenticationService,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(
        authenticationService: authenticationService,
      ),
    );
  }
}
