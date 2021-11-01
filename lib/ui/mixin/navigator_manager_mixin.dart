import 'package:aspnetcore_app/ui/common/route/route.dart';

mixin NavigatorManager {
  RouterNavigator _navigatorManager = RouterNavigator.getInstance();

  void navigateTo(String routeName, {bool removeOldRoutes = false}) {
    if(removeOldRoutes) {
      _navigatorManager.navigateAndRemoveTo(routeName);
    } else {
      _navigatorManager.navigateTo(routeName);
    }
  }
}
