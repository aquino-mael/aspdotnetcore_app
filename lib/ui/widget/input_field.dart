import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController? controller;
  final bool isPassword;
  final String label;

  const InputField({
    Key? key,
    this.controller,
    this.isPassword = false,
    required this.label,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  TextEditingController? get _controller => widget.controller;
  bool get _isPassword => widget.isPassword;
  String get _labelText => widget.label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      obscureText: _isPassword,
      decoration: InputDecoration(
        labelText: _labelText,
      ),
    );
  }
}
