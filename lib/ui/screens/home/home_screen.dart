import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
