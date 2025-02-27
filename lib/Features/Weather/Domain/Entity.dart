class ForecastEntity {
  final String date;
  final double maxTempC;
  final double minTempC;
  final double avgTempC;
  final double maxWindKph;
  final double totalPrecipMm;
  final int avgHumidity;
  final String conditionText;
  final String iconUrl;
  final double uv;
  final String sunrise;
  final String sunset;

  const ForecastEntity({
    required this.date,
    required this.maxTempC,
    required this.minTempC,
    required this.avgTempC,
    required this.maxWindKph,
    required this.totalPrecipMm,
    required this.avgHumidity,
    required this.conditionText,
    required this.iconUrl,
    required this.uv,
    required this.sunrise,
    required this.sunset,
  });
}
