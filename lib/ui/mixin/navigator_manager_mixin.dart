import '../common/route/route.dart';
import '../screens/screens.dart';

mixin NavigatorManager {
  RouterNavigator _navigatorManager = RouterNavigator.getInstance();

  void navigateTo(String routeName, {bool removeOldRoutes = false}) {
    if(removeOldRoutes) {
      _navigatorManager.navigateAndRemoveTo(routeName);
    } else {
      _navigatorManager.navigateTo(routeName);
    }
  }

  void logout() {
    return navigateTo(LoginScreen.routeName, removeOldRoutes: true);
  }
}
