part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial(
  {
    @Default(RequestStatus.init) RequestStatus status,
    UserCredential? credential,
    Failures? failures
}
      ) = _Initial;
}
