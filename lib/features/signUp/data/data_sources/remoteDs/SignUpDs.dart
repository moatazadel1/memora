import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:memora/features/signUp/data/models/userModel.dart';

import '../../models/userDetailsModel.dart';

abstract class SignUpDs{
  Future<UserCredential>SignUp(UserModel userModel,String password);
  Future<void>storeUser(UserDetailsModel userModel,String userUID);
  Stream<QuerySnapshot<UserModel>>getUser(String userUID);
}