import 'package:weatherapp/Features/Weather/Data/RemoteData.dart';
import 'package:weatherapp/Features/Weather/Domain/Repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Map<String, dynamic>> getUsers(int index) async {
    return await remoteDataSource.fetchUsers(index);
  }
}
