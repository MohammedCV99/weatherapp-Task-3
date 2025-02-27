import 'package:weatherapp/Features/Weather/Domain/Repository.dart';

class GetWeathersUseCase {
  final WeatherRepository repository;

  GetWeathersUseCase({required this.repository});

  Future<Map<String, dynamic>> call(int index) async {
    return await repository.getUsers(index);
  }
}
