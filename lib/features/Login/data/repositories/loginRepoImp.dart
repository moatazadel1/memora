import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:memora/core/failures/failures.dart';
import 'package:memora/features/Login/data/data_sources/loginDs.dart';
import 'package:memora/features/Login/domain/entities/LoginRepo.dart';
@Injectable(as: LoginRepo)
class LoginRepoImp implements LoginRepo{
  LoginDs loginDs;

  LoginRepoImp(this.loginDs);

  @override
  Future<Either<UserCredential, Failures>> login(String email, String password) async{
    try {
      var result= await loginDs.login(email, password);
      return left(result);
    } on FirebaseAuthException catch (e) {
      return right(RemoteFailure(e.code));
    }
  }

}