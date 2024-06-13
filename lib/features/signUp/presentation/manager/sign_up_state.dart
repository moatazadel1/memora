part of 'sign_up_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial(
  {
    @Default(RequestStatus.init) RequestStatus userstatus,
    @Default(RequestStatus.init) RequestStatus signstatus,
    @Default(LocationStatus.init)LocationStatus locationstatus,

    UserCredential? credential,
    Failures? failures,
    Position? location
  }
      ) = _Initial;
}
