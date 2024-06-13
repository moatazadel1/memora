import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:memora/features/Login/domain/entities/LoginRepo.dart';

import '../../../../core/failures/failures.dart';
@injectable
class LoginUseCase{
  LoginRepo loginRepo;

  LoginUseCase(this.loginRepo);
  Future<Either<UserCredential, Failures>>call(String email, String password)=>loginRepo.login(email, password);
}