import 'package:flutter/material.dart';

Widget SignUp_Button(BuildContext context, String Password, String rePassword,
    Function FUN, String input) {
  return Expanded(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        if (Password == rePassword) {
                          FUN();
                        }
                      },
                      child: Text(input))))));
}

Widget SignIn_Button(
    BuildContext context, String Password, Function FUN, String input) {
  return Expanded(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        FUN();
                      },
                      child: Text(input))))));
}
