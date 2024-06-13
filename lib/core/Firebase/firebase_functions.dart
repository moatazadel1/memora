import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:memora/features/activitiestab/data/model/activityModel.dart';
import '../../features/signUp/data/models/userDetailsModel.dart';
import '../../features/signUp/data/models/userModel.dart';
import '../../features/trackingtab/data/model/trackingModel.dart';

@injectable
class FirebaseFunctions {
  FirebaseAuth authInstance = FirebaseAuth.instance;
  // String? userUID;

  Future<UserCredential> signup(UserModel userModel, String password) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: userModel.email!,
      password: password,
    );
    userModel.id = credential.user!.uid;
    // userUID=credential.user!.uid;
    addUser(userModel);
    return credential;
  }

  Future<UserCredential> login(String email, String password) async {
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> addUser(UserModel userModel) async {
    try {
      var collection = FirebaseFirestore.instance
          .collection(UserModel.collectionName)
          .withConverter<UserModel>(
        fromFirestore: (snapshot, _) {
          return UserModel.fromJson(snapshot.data()!);
        },
        toFirestore: (value, _) {
          return value.toJson();
        },
      );
      collection.doc(userModel.id).set(userModel);
      print('Added successfully');
    } catch (e) {
      print('Error adding : $e');
    }
  }

  Future<UserModel> getUser(String userUID) async {
    try {
      var collection = FirebaseFirestore.instance
          .collection(UserModel.collectionName)
          .withConverter<UserModel>(
        fromFirestore: (snapshot, _) {
          return UserModel.fromJson(snapshot.data()!);
        },
        toFirestore: (value, _) {
          return value.toJson();
        },
      );
      var doc = await collection.doc(userUID).get();
      return doc.data() ??
          UserModel(); // Return an empty UserModel if doc.data() is null
    } catch (e) {
      print('Error getting user: $e');
      rethrow; // Rethrow the error
    }
  }

  Future<void> updateUser(UserDetailsModel userModel, String userUID) async {
    try {
      var collection = FirebaseFirestore.instance
          .collection(UserModel.collectionName)
          .withConverter<UserModel>(
        fromFirestore: (snapshot, _) {
          return UserModel.fromJson(snapshot.data()!);
        },
        toFirestore: (value, _) {
          return value.toJson();
        },
      );
      collection.doc(userUID).update(userModel.toJson());
      print('Updating successfully');
    } catch (e) {
      print('Error updating : $e');
    }
  }

  Future<void> addActivity(ActivityDetailsModel activityDetailsModel) async {
    try {
      var collection = FirebaseFirestore.instance
          .collection(ActivityDetailsModel.collecionName)
          .withConverter<ActivityDetailsModel>(
            fromFirestore: (snapshot, _) =>
                ActivityDetailsModel.fromJson(snapshot.data()!),
            toFirestore: (activity, _) => activity.toJson(),
          );
      var docRef = collection.doc();
      activityDetailsModel.id = docRef.id; // Use docRef.id to get unique ID
      await docRef.set(activityDetailsModel);
      print('Activity added successfully');
    } catch (e) {
      print('Error adding activity: $e');
    }
  }

  CollectionReference<ActivityDetailsModel> getActivitiesCollection() {
    return FirebaseFirestore.instance
        .collection(ActivityDetailsModel.collecionName)
        .withConverter<ActivityDetailsModel>(
      fromFirestore: (snapshot, _) {
        return ActivityDetailsModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  Stream<QuerySnapshot<UserModel>> getusers(String userUID) {
    var collection = FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter<UserModel>(fromFirestore: (snapshot, _) {
      return UserModel.fromJson(snapshot.data()!);
    }, toFirestore: (value, _) {
      return value.toJson();
    });
    return collection.where("id", isEqualTo: userUID).snapshots();
  }

  Stream<QuerySnapshot<ActivityDetailsModel>> getActivities() {
    var collection = getActivitiesCollection().orderBy("time").snapshots();
    return collection;
  }

  Future<void> deletActivities(String id) {
    return getActivitiesCollection().doc(id).delete();
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

Future<String?> getImageFromFirestore(String userUID) async {
  try {
    var collection = FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
    var doc = await collection.doc(userUID).get();
    var user = doc.data();
    return user?.imgPath;
  } catch (e) {
    print('Error fetching image: $e');
    return null;
  }
}

Future<void> saveLocation(TrackingModel trackingModel) async {
  var collection = FirebaseFirestore.instance
      .collection(TrackingModel.collecionName)
      .withConverter<TrackingModel>(
    fromFirestore: (snapshot, _) {
      return TrackingModel.fromJson(snapshot.data()!);
    },
    toFirestore: (value, _) {
      return value.toJson();
    },
  );
  var docRf = collection.doc();
  trackingModel.id = docRf.id;
  docRf.set(trackingModel);
}



  // Stream<QuerySnapshot<UserModel>> getusers(String userUID) {

  //   var collection = FirebaseFirestore.instance

  //       .collection(UserModel.collectionName)

  //       .withConverter<UserModel>(

  //     fromFirestore: (snapshot, _) {

  //       return UserModel.fromJson(snapshot.data()!);

  //     },

  //     toFirestore: (value, _) {

  //       return value.toJson();

  //     },

  //   );

  //   return collection.where("id", isEqualTo: userUID).snapshots();

  // }
//   Future<String?> getImageFromFirestore(String userUID) async {
//     try {
//       var collection = FirebaseFirestore.instance
//           .collection(UserModel.collectionName)
//           .withConverter<UserModel>(
//         fromFirestore: (snapshot, _) {
//           return UserModel.fromJson(snapshot.data()!);
//         },
//         toFirestore: (value, _) {
//           return value.toJson();
//         },
//       );
//       var doc = await collection.doc(userUID).get();
//       var user = doc.data();
//       return user?.imgPath;
//     } catch (e) {
//       print('Error fetching image: $e');
//       rethrow; // Rethrow the error
//     }
//   }
// }
