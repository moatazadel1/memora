import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/Location/location.dart';
import '../../../../core/enums/enums.dart';
import '../../../../core/failures/failures.dart';
import '../../data/models/userDetailsModel.dart';
import '../../data/models/userModel.dart';
import '../../domain/use_cases/signUp_useCase.dart';
import '../../domain/use_cases/storeuserUseCase.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';
part 'sign_up_bloc.freezed.dart';
@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpUseCase signUpUseCase;
  StoreUserUseCase storeUserUseCase;
  GetCurrentLocation getCurrentLocation;
  SignUpBloc(this.getCurrentLocation,this.signUpUseCase,this.storeUserUseCase) : super(const SignUpState.initial()) {
    on<Signup>((event, emit) async {
      emit(state.copyWith( signstatus:RequestStatus.loading));
      var result=await signUpUseCase.call(event.userModel,event.password);
      result.fold((l) => emit(
          state.copyWith(
              signstatus: RequestStatus.failure,
            failures: l
          )
      ), (r) => emit
        (
          state.copyWith(
            signstatus: RequestStatus.success,
            credential: r
          )

      )
      );

    });
    on<GetLocation>((event, emit) async{
      var result = await getCurrentLocation.getCurrentLocation();
      result.fold((l) =>emit(
          state.copyWith(
              locationstatus: LocationStatus.success,
              location: l
          )
      ), (r) => emit(
          state.copyWith(
              locationstatus: LocationStatus.failure,
              failures: r
          )
      ));

    });
    on<StoreUser>((event, emit)async {
      var result=await storeUserUseCase.call(event.userModel,event.userUID);
      result.fold((l) => emit(
         state.copyWith(
           failures: l,
           userstatus: RequestStatus.failure
         )
      ), (r) => emit(
        state.copyWith(
          userstatus: RequestStatus.success
        )
      ));
    });
  }
}
