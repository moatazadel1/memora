import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:memora/core/Firebase/firebase_functions.dart';
import 'package:memora/features/signUp/data/data_sources/remoteDs/SignUpDs.dart';
import 'package:memora/features/signUp/data/models/userModel.dart';

import '../../models/userDetailsModel.dart';

@Injectable(as: SignUpDs)
class SignUpDsImp implements SignUpDs {
  FirebaseFunctions firebaseFunctions;

  SignUpDsImp(this.firebaseFunctions);

  // @override
  // Future<UserCredential> SignUp(UserModel userModel, String password)async {
  //   return await firebaseFunctions.signup(userModel.email as UserModel, password);
  // }

  @override
  Future<void> storeUser(UserDetailsModel userModel, String userUID) async {
    await firebaseFunctions.updateUser(userModel, userUID);
  }

  @override
  Future<UserCredential> SignUp(UserModel userModel, String password) async {
    return await firebaseFunctions.signup(userModel, password);
  }

  @override
  Stream<QuerySnapshot<UserModel>> getUser(String userUID) {
    return getUser(userUID);
  }
}
