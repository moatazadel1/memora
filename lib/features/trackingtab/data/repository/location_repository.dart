// import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';
// import 'package:memora/core/failures/failures.dart';
// import 'package:memora/features/Details/data/data_sources/detailsDs.dart';
// import 'package:memora/features/Details/data/models/userDetailsModel.dart';
// import 'package:memora/features/Details/domain/repositories/detailsRepo.dart';
// @Injectable(as: DetailsRepo)
// class DetailsRepoImp implements DetailsRepo{
//   DetailsDs detailsDs;
//
//   DetailsRepoImp(this.detailsDs);
//
//   @override
//   Future<Either<void, Failures>> addDetails(UserDetailsModel userDetailsModel)async {
//     try{
//       var result =await detailsDs.storeUser(userDetailsModel);
//       return left(result);
//     }catch(e){
//       return right(RemoteFailure(e.toString()));
//     }
//   }
//
// }