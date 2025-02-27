import '../entities/user.dart';
import '../repositories/base_login_repository.dart';

class LoginUseCase {
  final BaseLoginRepository loginRepository;

  LoginUseCase({required this.loginRepository});

  Future<void> Login(UserLoginEntity userLoginEntity) async {
    final result =
        await loginRepository.login(userLoginEntity: userLoginEntity);
    return result;
  }

  Future<void> SignUp(UserLoginEntity userLoginEntity) async {
    final result =
        await loginRepository.Signup(userLoginEntity: userLoginEntity);
    return result;
  }
}
