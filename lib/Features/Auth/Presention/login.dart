import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherapp/Core/Compentes/Button.dart';
import 'package:weatherapp/Core/Compentes/Text.dart';
import 'package:weatherapp/Core/Compentes/TextFormField.dart';
import 'package:weatherapp/Core/Compentes/Toast.dart';
import 'package:weatherapp/Core/Main_Attributes/Strings.dart';
import 'package:weatherapp/Core/Routes/App_Routes.dart';
import 'package:weatherapp/Features/Auth/Presention/User_Login/UserCubit.dart';
import 'package:weatherapp/Features/Auth/Presention/User_Login/UserState.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: BlocConsumer<LoginCubit, LoginStates>(builder: (context, state) {
          return ListView(
            children: [
              Image.network(Main_background),
              Padding(
                  padding: const EdgeInsets.all(12),
                  child: H1("Weather App\nEnsure your safety !")),
              const SizedBox(height: 100),
              Input("Email", "Enter your Email Address", Email, false),
              Input("Password", "Enter your Password", Password, true),
              SignIn_Button(context, Password.text, () {
                LoginCubit.of(context).userLogin(
                    Email: Email.text,
                    password: Password.text,
                    context: context);
              }, "Log In"),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: TextButton(
                      onPressed: () {
                        GoRouter.of(context).go(AppRouter.kSignup);
                      },
                      child: const Text("Don't have an account ?"))),
            ],
          );
        }, listener: (context, state) {
          if (state is LoginSuccessState) {
            GoRouter.of(context).go(AppRouter.kWeather);
          } else if (state is LoginErrorState) {
            ToastAction("Email or password are wrong", Colors.red);
          }
        }));
  }
}
