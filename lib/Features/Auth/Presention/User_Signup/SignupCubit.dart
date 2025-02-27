import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Features/Auth/Presention/User_Signup/SignupState.dart';

class Signupcubit extends Cubit<SignupStates> {
  Signupcubit() : super(SignupLoadingState());

  static Signupcubit of(BuildContext context) =>
      BlocProvider.of<Signupcubit>(context);

  Future<void> Signup({
    required String Email,
    required String password,
    required BuildContext context,
  }) async {
    emit(SignupInitialState());
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: Email, password: password)
        .catchError((onError) {
      emit(SignupErrorState());
    });

    emit(SignupSuccessState());
  }
}
