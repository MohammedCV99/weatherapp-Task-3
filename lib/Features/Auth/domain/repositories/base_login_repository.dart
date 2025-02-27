import 'package:weatherapp/Features/Auth/domain/entities/user.dart';

abstract class BaseLoginRepository {
  Future<void> login({required UserLoginEntity userLoginEntity});
  Future<void> Signup({required UserLoginEntity userLoginEntity});
}
