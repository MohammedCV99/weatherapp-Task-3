import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Features/Weather/Domain/UseCase.dart';
import 'package:weatherapp/Features/Weather/Presention/State_Mangement/Weather/State/Weather_State.dart';
//https://api.weatherapi.com/v1/marine.json?key=2f54cf56ae0246859a5230043251702&q=kuwait&days=7

class Weathercubit extends Cubit<Weatherstate> {
  final GetWeathersUseCase getUsersUseCase;
  Weathercubit(this.getUsersUseCase) : super(WeatherInitialState());

  static Weathercubit of(BuildContext context) =>
      BlocProvider.of<Weathercubit>(context);

  Future<void> getweather({required BuildContext context}) async {
    emit(WeatherInitialState());
    try {
      final data = await getUsersUseCase.call(index);
      print(data);
      emit(WeatherGetInformationState());
    } catch (error) {
      emit(WeatherErrorState());
    }
  }

  int index = 0;
  void updateIndex({required int i, required BuildContext context}) {
    index = i;
    emit(UpdateIndex());
  }

  List<int> output = [];
 Future<void> ConvertAPItoOutputFun(double Avg_temp, double Avg_Humidity) async {
    if (Avg_temp > 30 && Avg_Humidity > 80) {
      output = [0, 1, 1, 0, 1];
    } else if (Avg_temp > 30 && Avg_Humidity < 80) {
      output = [0, 1, 1, 0, 0];
    } else if ((Avg_temp > 15 && Avg_temp < 30) && Avg_Humidity > 80) {
      output = [0, 0, 0, 1, 1];
    } else if ((Avg_temp > 15 && Avg_temp < 30) && Avg_Humidity < 80) {
      output = [0, 0, 0, 1, 0];
    } else if ((Avg_temp < 15) && Avg_Humidity < 80) {
      output = [1, 0, 0, 0, 0];
    } else {
      output = [1, 0, 0, 0, 1];
    }
    emit(PredicitState());
  }
}
