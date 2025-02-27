import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Features/Auth/Presention/User_Login/UserState.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit of(BuildContext context) =>
      BlocProvider.of<LoginCubit>(context);

  Future<void> userLogin({
    required String Email,
    required String password,
    required BuildContext context,
  }) async {
    emit(LoginLoadingState());
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: Email, password: password)
        .catchError((onError) {
      emit(LoginErrorState());
    });
    emit(LoginSuccessState());
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPasswordVisible = true;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    suffix = isPasswordVisible
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(SeePassState());
  }
}
