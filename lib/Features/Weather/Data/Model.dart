import 'package:weatherapp/Features/Weather/Domain/Entity.dart';

class ForecastModel extends ForecastEntity {
  ForecastModel({
    required super.date,
    required super.maxTempC,
    required super.minTempC,
    required super.avgTempC,
    required super.maxWindKph,
    required super.totalPrecipMm,
    required super.avgHumidity,
    required super.conditionText,
    required super.iconUrl,
    required super.uv,
    required super.sunrise,
    required super.sunset,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      date: json['date'],
      maxTempC: json['day']['maxtemp_c'].toDouble(),
      minTempC: json['day']['mintemp_c'].toDouble(),
      avgTempC: json['day']['avgtemp_c'].toDouble(),
      maxWindKph: json['day']['maxwind_kph'].toDouble(),
      totalPrecipMm: json['day']['totalprecip_mm'].toDouble(),
      avgHumidity: json['day']['avghumidity'].toInt(),
      conditionText: json['day']['condition']['text'],
      iconUrl: json['day']['condition']['icon'],
      uv: json['day']['uv'].toDouble(),
      sunrise: json['astro']['sunrise'],
      sunset: json['astro']['sunset'],
    );
  }
}
