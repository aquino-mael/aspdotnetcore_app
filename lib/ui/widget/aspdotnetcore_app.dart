import 'package:flutter/material.dart';

import '../../data/service/authentication_service.dart';
import '../../data/service/user_service.dart';
import '../common/common.dart';
import '../screens/login/login_controller.dart';
import '../screens/screens.dart';

class AspDotNetCoreApp extends StatelessWidget {

  const AspDotNetCoreApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: RouterNavigator.navigatorKey,
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(
          loginController: LoginController(
            AuthenticationService(
              client: kHttpClient,
              url: kUrl,
            ),
          ),
        ),
        HomeScreen.routeName: (context) => HomeScreen(
          controller: HomeController(
            UserService(
              client: kHttpClient,
              url: kUrl,
            )
          ),
        ),
      },
    );
  }
}
