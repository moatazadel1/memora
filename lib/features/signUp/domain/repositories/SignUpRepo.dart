import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:memora/core/failures/failures.dart';
import 'package:memora/features/signUp/data/models/userModel.dart';

import '../../data/models/userDetailsModel.dart';

abstract class SignUpRepo{
  Future<Either<Failures,UserCredential>>signUp(UserModel userModel,String password);
  Future<Either<Failures,void>>storeUser(UserDetailsModel userModel,String userUID);
  // Stream<Either<Failures,QuerySnapshot<UserModel>>>getuser(String userUID);
}