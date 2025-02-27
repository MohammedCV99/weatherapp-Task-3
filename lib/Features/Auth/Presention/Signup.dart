import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherapp/Core/Compentes/Button.dart';
import 'package:weatherapp/Core/Compentes/Text.dart';
import 'package:weatherapp/Core/Compentes/TextFormField.dart';
import 'package:weatherapp/Core/Compentes/Toast.dart';
import 'package:weatherapp/Core/Main_Attributes/Strings.dart';
import 'package:weatherapp/Core/Routes/App_Routes.dart';
import 'package:weatherapp/Features/Auth/Presention/User_Signup/SignupCubit.dart';
import 'package:weatherapp/Features/Auth/Presention/User_Signup/SignupState.dart';
import '../../../Firebaseoptions.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _MyAppState();
}

class _MyAppState extends State<Signup> {
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController Re_Password = TextEditingController();

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        body: SafeArea(
            child: BlocConsumer<Signupcubit, SignupStates>(
                listener: (context, state) {
          if (state is SignupSuccessState) {
            GoRouter.of(context).go(AppRouter.kLogin);
          } else if (state is SignupErrorState) {
            ToastAction("There is something wrong in your Sign up process !",
                Colors.red);
          }
        }, builder: (context, state) {
          return ListView(
            children: [
              Image.network(Main_background),
              Padding(
                  padding: const EdgeInsets.all(12),
                  child: H1("Weather App\nEnsure your safety !")),
              const SizedBox(height: 100),
              Input("Email", "Enter your Email Address", Email, false),
              Input("Password", "Enter your Password", Password, true),
              Input("Re_Password", "Enter your Repeated Password", Re_Password,
                  true),
              SignUp_Button(context, Password.text, Re_Password.text, () {
                Signupcubit.of(context).Signup(
                    Email: Email.text,
                    password: Password.text,
                    context: context);
              }, "Sign Up"),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: TextButton(
                      onPressed: () {
                        GoRouter.of(context).go(AppRouter.kLogin);
                      },
                      child: const Text("Already have an account ?"))),
            ],
          );
        })));
  }
}
