import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:memora/features/signUp/data/models/userModel.dart';
import 'package:memora/features/signUp/domain/repositories/SignUpRepo.dart';

import '../../../../core/failures/failures.dart';
import '../../data/models/userDetailsModel.dart';
@injectable
class StoreUserUseCase{
  SignUpRepo signUpRepo;

  StoreUserUseCase(this.signUpRepo);
  Future<Either<Failures, void>>call(UserDetailsModel userModel,String userUID)=>signUpRepo.storeUser(userModel,userUID);
}