import 'package:flutter/material.dart';

mixin KeyboardManager {
  void hideKeyboard(BuildContext context) {
    final focus = FocusScope.of(context);

    if(!focus.hasPrimaryFocus) {
      focus.unfocus();
    }
  }
}
