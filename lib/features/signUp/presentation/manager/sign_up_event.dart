part of 'sign_up_bloc.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.started() = _Started;
  const factory SignUpEvent.signup({
    required UserModel userModel,
    required String password
  }) = Signup;
  const factory SignUpEvent.getLocation() = GetLocation;
  const factory SignUpEvent.storeUser({
    required UserDetailsModel userModel,
    required String userUID
  }) = StoreUser;
}
