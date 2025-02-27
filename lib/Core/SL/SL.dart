import 'package:get_it/get_it.dart';
import 'package:weatherapp/Features/Weather/Data/RemoteData.dart';
import 'package:weatherapp/Features/Weather/Data/Repository.dart';
import 'package:weatherapp/Features/Weather/Domain/Repository.dart';
import 'package:weatherapp/Features/Weather/Domain/UseCase.dart';
import 'package:weatherapp/Features/Weather/Presention/State_Mangement/Weather/Cubit/Weather_Cubit.dart';

final sl = GetIt.instance;

void setup() {
  //sl.registerLazySingleton<BaseLoginRepository>(() => LoginRepositoryImpl(
  //    loginRemoteDataSource: sl(),
  //));
  // sl.registerLazySingleton<LoginUseCase>(
  //  () => LoginUseCase(loginRepository: sl()));
  //sl.registerFactory(() => LoginCubit(sl()));
  UserRemoteDataSourceImpl remoteDataSource = UserRemoteDataSourceImpl();
  WeatherRepository repository =
      WeatherRepositoryImpl(remoteDataSource: remoteDataSource);
  GetWeathersUseCase getWeathersUseCase = GetWeathersUseCase(repository: sl());
  Weathercubit weathercubit = Weathercubit(getWeathersUseCase);
}
