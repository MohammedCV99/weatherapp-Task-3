import 'package:flutter/material.dart';

Widget Input(String Label, String HintText, TextEditingController controller,
    bool obscure) {
  return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            label: Text(Label),
            hintText: HintText),
        controller: controller,
        autocorrect: true,
        textInputAction: TextInputAction.next,
        obscureText: obscure,
      ));
}
