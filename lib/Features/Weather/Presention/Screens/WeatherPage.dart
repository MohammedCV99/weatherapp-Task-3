import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/Core/Compentes/Text.dart';
import 'package:weatherapp/Core/Compentes/Toast.dart';
import 'package:weatherapp/Core/Main_Attributes/Date_Helper.dart';
import 'package:weatherapp/Core/Routes/App_Routes.dart';
import 'package:weatherapp/Features/Weather/Presention/State_Mangement/Weather/Cubit/Weather_Cubit.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  int value=-1;
  String Final_Predication(int value){
    if(value==0){
      return "Be careful the weather is not clear";
    }
    else if(value==1){
      return "weather is clear you can go";

    }
    else{
      return " ";

    }
  }

  Future<void> getPrediction(List<int> features) async {
    final url = Uri.parse('http://192.168.8.11:5001/predict');

    // Create the POST request body
    Map<String, dynamic> body = {'features': features};

    // Send the POST request
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    // Handle the response
    if (response.statusCode == 200) {
      final prediction = json.decode(response.body)['prediction'];
      setState(() {
        value=prediction[0];
      });
      if (kDebugMode) {
        print('Prediction: $prediction');
      }
    } else {
      if (kDebugMode) {
        print('Failed to get prediction');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
    backgroundColor:Colors.white,
        elevation: 0,
          actions: [
            IconButton(onPressed: (){

              GoRouter.of(context).go(AppRouter.kLogin);

            }, icon: Icon(Icons.logout))
          ],
    ),
        body: ListView(
      children: [
        SizedBox(
          height: 100,
        ),
        Padding(
            padding: EdgeInsets.all(8),
            child: H2(
              'Welcome to Weather App',
            )),
        Padding(
            padding: EdgeInsets.all(8),
            child: h2(
              'Check the status of the Weather from here',
            )),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 50,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                    width: 125,
                    height: 50,
                    child:Padding(padding:EdgeInsets.all(4), child: ElevatedButton(
                      onPressed: () {
                        weathercubit.updateIndex(i: index, context: context);
                        print(weathercubit.index);
                        setState(() {});
                      },
                      child: h3(dates[index].toString()),
                    )));
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 10,
                );
              },
              itemCount: 5),
        ),
        Divider(
          color: Colors.black,
        ),
        FutureBuilder<Map<String, dynamic>>(
          future: weathercubit.getUsersUseCase.repository
              .getUsers(weathercubit.index),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No data available');
            } else {
              return Padding(
                  padding: EdgeInsets.all(4),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                h3("Current Temp "),
                                h3(snapshot.data!['day']['avgtemp_c']
                                        .toString() +
                                    " C"),
                              ],
                            ),
                            Column(
                              children: [
                                h3("Condition "),
                                h3(snapshot.data!['day']['condition']['text']),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                h3("Minimum Temp "),
                                h3(snapshot.data!['day']['mintemp_c']
                                        .toString() +
                                    " C"),
                              ],
                            ),
                            Column(children: [
                              h3("Maximum Temp "),
                              h3(snapshot.data!['day']['maxtemp_c'].toString() +
                                  " C"),
                            ]),
                          ],
                        ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(child:   ElevatedButton(
                            onPressed: () {
                              weathercubit.ConvertAPItoOutputFun(
                                  snapshot.data!['day']['avgtemp_c'],
                                  snapshot.data!['day']['avghumidity']).then((value){

                              });
                              getPrediction(weathercubit.output);
                              

                              print("done");
                            },
                            child: h3("Predict the weather"))),
SizedBox(
  height: 50,
),
                        Text("Final predication : ${Final_Predication(value)}")
                      ]));
            }
          },
        ),
      ],
    ));
  }
}
