import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/base_login_repository.dart';

class LoginRepositoryImpl implements BaseLoginRepository {
  LoginRepositoryImpl({required Object loginRemoteDataSource});

  @override
  Future<void> login({required UserLoginEntity userLoginEntity}) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: userLoginEntity.userName,
            password: userLoginEntity.password);

    return;
  }

  @override
  Future<void> Signup({required UserLoginEntity userLoginEntity}) async {
    // TODO: implement Signup
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: userLoginEntity.userName,
            password: userLoginEntity.password);
  }
}
