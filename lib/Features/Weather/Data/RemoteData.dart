import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class WeatherRemoteDataSource {
  Future<Map<String, dynamic>> fetchUsers(int index);
}

class UserRemoteDataSourceImpl implements WeatherRemoteDataSource {
  UserRemoteDataSourceImpl();

  @override
  Future<Map<String, dynamic>> fetchUsers(int index) async {
    final response = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/marine.json?key=2f54cf56ae0246859a5230043251702&q=kuwait&days=7'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonList = json.decode(response.body);
      return jsonList['forecast']['forecastday'][index];
    } else {
      throw Exception('Failed to load Weather Information');
    }
  }
}
