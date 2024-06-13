import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:memora/core/failures/failures.dart';

abstract class LoginRepo{
  Future<Either<UserCredential,Failures>>login(String email,String password);
}