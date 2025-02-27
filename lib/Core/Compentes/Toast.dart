import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void ToastAction(String input, Color Color) {
  Fluttertoast.showToast(
      msg: input,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color,
      textColor: Colors.white,
      fontSize: 12.0);
}
