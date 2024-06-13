import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:memora/features/signUp/domain/repositories/SignUpRepo.dart';

import '../../../../core/failures/failures.dart';
import '../../data/models/userModel.dart';
@injectable
class SignUpUseCase{
  SignUpRepo signUpRepo;

  SignUpUseCase(this.signUpRepo);
  Future<Either<Failures, UserCredential>>call(UserModel userModel, String password)=>signUpRepo.signUp(userModel, password);
}