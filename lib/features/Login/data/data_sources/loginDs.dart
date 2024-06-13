import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginDs{
  Future<UserCredential>login(String email,String password);
}