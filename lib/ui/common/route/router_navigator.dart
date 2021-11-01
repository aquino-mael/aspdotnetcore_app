import 'package:flutter/material.dart';

class RouterNavigator {
  const RouterNavigator._();
  static const RouterNavigator _instance = RouterNavigator._();
  factory RouterNavigator.getInstance() => _instance;

  static final navigatorKey = GlobalKey<NavigatorState>();

  Future<T?> navigateTo<T>(String routeName) async {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<void> navigateAndRemoveTo(String routeName) async {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil<void>(routeName, (route) => false);
  }
}
