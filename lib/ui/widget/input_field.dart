import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController? controller;
  final bool isPassword;
  final String label;
  final void Function(String)? onChanged;

  const InputField({
    required this.label,
    Key? key,
    this.controller,
    this.isPassword = false,
    this.onChanged,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  String get _labelText => widget.label;
  TextEditingController? get _controller => widget.controller;
  bool get _isPassword => widget.isPassword;
  void Function(String)? get _onChanged => widget.onChanged;
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      obscureText: _isPassword,
      onChanged: _onChanged,
      decoration: InputDecoration(
        labelText: _labelText,
      ),
    );
  }
}
