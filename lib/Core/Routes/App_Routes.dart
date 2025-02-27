import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherapp/Features/Auth/Presention/User_Login/UserCubit.dart';
import 'package:weatherapp/Features/Auth/Presention/User_Signup/SignupCubit.dart';
import 'package:weatherapp/Features/Auth/Presention/login.dart';
import 'package:weatherapp/Features/Auth/Presention/Signup.dart';
import 'package:weatherapp/Features/Weather/Data/RemoteData.dart';
import 'package:weatherapp/Features/Weather/Data/Repository.dart';
import 'package:weatherapp/Features/Weather/Domain/Repository.dart';
import 'package:weatherapp/Features/Weather/Domain/UseCase.dart';
import 'package:weatherapp/Features/Weather/Presention/Screens/WeatherPage.dart'
    show WeatherPage, WeatherPageState;
import 'package:weatherapp/Features/Weather/Presention/State_Mangement/Weather/Cubit/Weather_Cubit.dart';

UserRemoteDataSourceImpl remoteDataSource = UserRemoteDataSourceImpl();
WeatherRepository repository =
    WeatherRepositoryImpl(remoteDataSource: remoteDataSource);
GetWeathersUseCase getWeathersUseCase =
    GetWeathersUseCase(repository: repository);
Weathercubit weathercubit = Weathercubit(getWeathersUseCase);

class AppRouter {
  static const String kWeather = '/WeatherPage';
  static const String kLogin = '/login';
  static const String kSignup = '/Signup';
}

final route = GoRouter(
    initialLocation: AppRouter.kSignup,
    errorPageBuilder: (context, state) =>
        const MaterialPage(child: Scaffold(body: Text('Not Found'))),
    routes: [
      GoRoute(
          path: AppRouter.kSignup,
          builder: (context, state) => BlocProvider(
                create: (context) => Signupcubit(),
                child: const Signup(),
              )),
      GoRoute(
          path: AppRouter.kLogin,
          builder: (context, state) => BlocProvider(
                create: (context) => LoginCubit(),
                child: const login(),
              )),
      GoRoute(
          path: AppRouter.kWeather,
          builder: (context, state) => BlocProvider(
                create: (context) => weathercubit,
                child: WeatherPage(),
              )),
    ]);
