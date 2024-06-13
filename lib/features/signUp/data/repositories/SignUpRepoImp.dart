import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:memora/core/failures/failures.dart';
import 'package:memora/features/signUp/data/data_sources/remoteDs/SignUpDs.dart';
import 'package:memora/features/signUp/data/models/userModel.dart';
import 'package:memora/features/signUp/domain/repositories/SignUpRepo.dart';

import '../models/userDetailsModel.dart';
@Injectable(as: SignUpRepo)
class SignUpRepoImp implements SignUpRepo{
  SignUpDs signUpDs;

  SignUpRepoImp(this.signUpDs);

  @override
  Future<Either<Failures, UserCredential>> signUp(UserModel userModel, String password)async {
    try {
      var result= await signUpDs.SignUp(userModel, password);
      return right( result);
    } on FirebaseAuthException catch (e) {
      return left(RemoteFailure(e.message!));
    } catch (e) {
      return left(RemoteFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> storeUser(UserDetailsModel userModel,String userUID)async {
    try{
       var result =await signUpDs.storeUser(userModel,userUID);
      return right(result);
    }catch(e){
      return left(RemoteFailure(e.toString()));
    }
  }




}