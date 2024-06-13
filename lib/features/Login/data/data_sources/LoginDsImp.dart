import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:memora/core/Firebase/firebase_functions.dart';
import 'package:memora/features/Login/data/data_sources/loginDs.dart';

@Injectable(as: LoginDs)
class LoginDsImp implements LoginDs {
  FirebaseFunctions firebaseFunctions;

  LoginDsImp(this.firebaseFunctions);

  @override
  Future<UserCredential> login(String email, String password) async {
    return await firebaseFunctions.login(email, password);
  }
}
