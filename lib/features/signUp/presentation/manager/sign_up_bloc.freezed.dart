// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignUpEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserModel userModel, String password) signup,
    required TResult Function() getLocation,
    required TResult Function(UserDetailsModel userModel, String userUID)
        storeUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UserModel userModel, String password)? signup,
    TResult? Function()? getLocation,
    TResult? Function(UserDetailsModel userModel, String userUID)? storeUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserModel userModel, String password)? signup,
    TResult Function()? getLocation,
    TResult Function(UserDetailsModel userModel, String userUID)? storeUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(Signup value) signup,
    required TResult Function(GetLocation value) getLocation,
    required TResult Function(StoreUser value) storeUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(Signup value)? signup,
    TResult? Function(GetLocation value)? getLocation,
    TResult? Function(StoreUser value)? storeUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(Signup value)? signup,
    TResult Function(GetLocation value)? getLocation,
    TResult Function(StoreUser value)? storeUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpEventCopyWith<$Res> {
  factory $SignUpEventCopyWith(
          SignUpEvent value, $Res Function(SignUpEvent) then) =
      _$SignUpEventCopyWithImpl<$Res, SignUpEvent>;
}

/// @nodoc
class _$SignUpEventCopyWithImpl<$Res, $Val extends SignUpEvent>
    implements $SignUpEventCopyWith<$Res> {
  _$SignUpEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'SignUpEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserModel userModel, String password) signup,
    required TResult Function() getLocation,
    required TResult Function(UserDetailsModel userModel, String userUID)
        storeUser,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UserModel userModel, String password)? signup,
    TResult? Function()? getLocation,
    TResult? Function(UserDetailsModel userModel, String userUID)? storeUser,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserModel userModel, String password)? signup,
    TResult Function()? getLocation,
    TResult Function(UserDetailsModel userModel, String userUID)? storeUser,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(Signup value) signup,
    required TResult Function(GetLocation value) getLocation,
    required TResult Function(StoreUser value) storeUser,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(Signup value)? signup,
    TResult? Function(GetLocation value)? getLocation,
    TResult? Function(StoreUser value)? storeUser,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(Signup value)? signup,
    TResult Function(GetLocation value)? getLocation,
    TResult Function(StoreUser value)? storeUser,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SignUpEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$SignupImplCopyWith<$Res> {
  factory _$$SignupImplCopyWith(
          _$SignupImpl value, $Res Function(_$SignupImpl) then) =
      __$$SignupImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel userModel, String password});
}

/// @nodoc
class __$$SignupImplCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$SignupImpl>
    implements _$$SignupImplCopyWith<$Res> {
  __$$SignupImplCopyWithImpl(
      _$SignupImpl _value, $Res Function(_$SignupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userModel = null,
    Object? password = null,
  }) {
    return _then(_$SignupImpl(
      userModel: null == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignupImpl implements Signup {
  const _$SignupImpl({required this.userModel, required this.password});

  @override
  final UserModel userModel;
  @override
  final String password;

  @override
  String toString() {
    return 'SignUpEvent.signup(userModel: $userModel, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupImpl &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userModel, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupImplCopyWith<_$SignupImpl> get copyWith =>
      __$$SignupImplCopyWithImpl<_$SignupImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserModel userModel, String password) signup,
    required TResult Function() getLocation,
    required TResult Function(UserDetailsModel userModel, String userUID)
        storeUser,
  }) {
    return signup(userModel, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UserModel userModel, String password)? signup,
    TResult? Function()? getLocation,
    TResult? Function(UserDetailsModel userModel, String userUID)? storeUser,
  }) {
    return signup?.call(userModel, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserModel userModel, String password)? signup,
    TResult Function()? getLocation,
    TResult Function(UserDetailsModel userModel, String userUID)? storeUser,
    required TResult orElse(),
  }) {
    if (signup != null) {
      return signup(userModel, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(Signup value) signup,
    required TResult Function(GetLocation value) getLocation,
    required TResult Function(StoreUser value) storeUser,
  }) {
    return signup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(Signup value)? signup,
    TResult? Function(GetLocation value)? getLocation,
    TResult? Function(StoreUser value)? storeUser,
  }) {
    return signup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(Signup value)? signup,
    TResult Function(GetLocation value)? getLocation,
    TResult Function(StoreUser value)? storeUser,
    required TResult orElse(),
  }) {
    if (signup != null) {
      return signup(this);
    }
    return orElse();
  }
}

abstract class Signup implements SignUpEvent {
  const factory Signup(
      {required final UserModel userModel,
      required final String password}) = _$SignupImpl;

  UserModel get userModel;
  String get password;
  @JsonKey(ignore: true)
  _$$SignupImplCopyWith<_$SignupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetLocationImplCopyWith<$Res> {
  factory _$$GetLocationImplCopyWith(
          _$GetLocationImpl value, $Res Function(_$GetLocationImpl) then) =
      __$$GetLocationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetLocationImplCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$GetLocationImpl>
    implements _$$GetLocationImplCopyWith<$Res> {
  __$$GetLocationImplCopyWithImpl(
      _$GetLocationImpl _value, $Res Function(_$GetLocationImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetLocationImpl implements GetLocation {
  const _$GetLocationImpl();

  @override
  String toString() {
    return 'SignUpEvent.getLocation()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetLocationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserModel userModel, String password) signup,
    required TResult Function() getLocation,
    required TResult Function(UserDetailsModel userModel, String userUID)
        storeUser,
  }) {
    return getLocation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UserModel userModel, String password)? signup,
    TResult? Function()? getLocation,
    TResult? Function(UserDetailsModel userModel, String userUID)? storeUser,
  }) {
    return getLocation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserModel userModel, String password)? signup,
    TResult Function()? getLocation,
    TResult Function(UserDetailsModel userModel, String userUID)? storeUser,
    required TResult orElse(),
  }) {
    if (getLocation != null) {
      return getLocation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(Signup value) signup,
    required TResult Function(GetLocation value) getLocation,
    required TResult Function(StoreUser value) storeUser,
  }) {
    return getLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(Signup value)? signup,
    TResult? Function(GetLocation value)? getLocation,
    TResult? Function(StoreUser value)? storeUser,
  }) {
    return getLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(Signup value)? signup,
    TResult Function(GetLocation value)? getLocation,
    TResult Function(StoreUser value)? storeUser,
    required TResult orElse(),
  }) {
    if (getLocation != null) {
      return getLocation(this);
    }
    return orElse();
  }
}

abstract class GetLocation implements SignUpEvent {
  const factory GetLocation() = _$GetLocationImpl;
}

/// @nodoc
abstract class _$$StoreUserImplCopyWith<$Res> {
  factory _$$StoreUserImplCopyWith(
          _$StoreUserImpl value, $Res Function(_$StoreUserImpl) then) =
      __$$StoreUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserDetailsModel userModel, String userUID});
}

/// @nodoc
class __$$StoreUserImplCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$StoreUserImpl>
    implements _$$StoreUserImplCopyWith<$Res> {
  __$$StoreUserImplCopyWithImpl(
      _$StoreUserImpl _value, $Res Function(_$StoreUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userModel = null,
    Object? userUID = null,
  }) {
    return _then(_$StoreUserImpl(
      userModel: null == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserDetailsModel,
      userUID: null == userUID
          ? _value.userUID
          : userUID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StoreUserImpl implements StoreUser {
  const _$StoreUserImpl({required this.userModel, required this.userUID});

  @override
  final UserDetailsModel userModel;
  @override
  final String userUID;

  @override
  String toString() {
    return 'SignUpEvent.storeUser(userModel: $userModel, userUID: $userUID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreUserImpl &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel) &&
            (identical(other.userUID, userUID) || other.userUID == userUID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userModel, userUID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreUserImplCopyWith<_$StoreUserImpl> get copyWith =>
      __$$StoreUserImplCopyWithImpl<_$StoreUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserModel userModel, String password) signup,
    required TResult Function() getLocation,
    required TResult Function(UserDetailsModel userModel, String userUID)
        storeUser,
  }) {
    return storeUser(userModel, userUID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UserModel userModel, String password)? signup,
    TResult? Function()? getLocation,
    TResult? Function(UserDetailsModel userModel, String userUID)? storeUser,
  }) {
    return storeUser?.call(userModel, userUID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserModel userModel, String password)? signup,
    TResult Function()? getLocation,
    TResult Function(UserDetailsModel userModel, String userUID)? storeUser,
    required TResult orElse(),
  }) {
    if (storeUser != null) {
      return storeUser(userModel, userUID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(Signup value) signup,
    required TResult Function(GetLocation value) getLocation,
    required TResult Function(StoreUser value) storeUser,
  }) {
    return storeUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(Signup value)? signup,
    TResult? Function(GetLocation value)? getLocation,
    TResult? Function(StoreUser value)? storeUser,
  }) {
    return storeUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(Signup value)? signup,
    TResult Function(GetLocation value)? getLocation,
    TResult Function(StoreUser value)? storeUser,
    required TResult orElse(),
  }) {
    if (storeUser != null) {
      return storeUser(this);
    }
    return orElse();
  }
}

abstract class StoreUser implements SignUpEvent {
  const factory StoreUser(
      {required final UserDetailsModel userModel,
      required final String userUID}) = _$StoreUserImpl;

  UserDetailsModel get userModel;
  String get userUID;
  @JsonKey(ignore: true)
  _$$StoreUserImplCopyWith<_$StoreUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignUpState {
  RequestStatus get userstatus => throw _privateConstructorUsedError;
  RequestStatus get signstatus => throw _privateConstructorUsedError;
  LocationStatus get locationstatus => throw _privateConstructorUsedError;
  UserCredential? get credential => throw _privateConstructorUsedError;
  Failures? get failures => throw _privateConstructorUsedError;
  Position? get location => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            RequestStatus userstatus,
            RequestStatus signstatus,
            LocationStatus locationstatus,
            UserCredential? credential,
            Failures? failures,
            Position? location)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            RequestStatus userstatus,
            RequestStatus signstatus,
            LocationStatus locationstatus,
            UserCredential? credential,
            Failures? failures,
            Position? location)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            RequestStatus userstatus,
            RequestStatus signstatus,
            LocationStatus locationstatus,
            UserCredential? credential,
            Failures? failures,
            Position? location)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res, SignUpState>;
  @useResult
  $Res call(
      {RequestStatus userstatus,
      RequestStatus signstatus,
      LocationStatus locationstatus,
      UserCredential? credential,
      Failures? failures,
      Position? location});
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userstatus = null,
    Object? signstatus = null,
    Object? locationstatus = null,
    Object? credential = freezed,
    Object? failures = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      userstatus: null == userstatus
          ? _value.userstatus
          : userstatus // ignore: cast_nullable_to_non_nullable
              as RequestStatus,
      signstatus: null == signstatus
          ? _value.signstatus
          : signstatus // ignore: cast_nullable_to_non_nullable
              as RequestStatus,
      locationstatus: null == locationstatus
          ? _value.locationstatus
          : locationstatus // ignore: cast_nullable_to_non_nullable
              as LocationStatus,
      credential: freezed == credential
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as UserCredential?,
      failures: freezed == failures
          ? _value.failures
          : failures // ignore: cast_nullable_to_non_nullable
              as Failures?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Position?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestStatus userstatus,
      RequestStatus signstatus,
      LocationStatus locationstatus,
      UserCredential? credential,
      Failures? failures,
      Position? location});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userstatus = null,
    Object? signstatus = null,
    Object? locationstatus = null,
    Object? credential = freezed,
    Object? failures = freezed,
    Object? location = freezed,
  }) {
    return _then(_$InitialImpl(
      userstatus: null == userstatus
          ? _value.userstatus
          : userstatus // ignore: cast_nullable_to_non_nullable
              as RequestStatus,
      signstatus: null == signstatus
          ? _value.signstatus
          : signstatus // ignore: cast_nullable_to_non_nullable
              as RequestStatus,
      locationstatus: null == locationstatus
          ? _value.locationstatus
          : locationstatus // ignore: cast_nullable_to_non_nullable
              as LocationStatus,
      credential: freezed == credential
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as UserCredential?,
      failures: freezed == failures
          ? _value.failures
          : failures // ignore: cast_nullable_to_non_nullable
              as Failures?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Position?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.userstatus = RequestStatus.init,
      this.signstatus = RequestStatus.init,
      this.locationstatus = LocationStatus.init,
      this.credential,
      this.failures,
      this.location});

  @override
  @JsonKey()
  final RequestStatus userstatus;
  @override
  @JsonKey()
  final RequestStatus signstatus;
  @override
  @JsonKey()
  final LocationStatus locationstatus;
  @override
  final UserCredential? credential;
  @override
  final Failures? failures;
  @override
  final Position? location;

  @override
  String toString() {
    return 'SignUpState.initial(userstatus: $userstatus, signstatus: $signstatus, locationstatus: $locationstatus, credential: $credential, failures: $failures, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.userstatus, userstatus) ||
                other.userstatus == userstatus) &&
            (identical(other.signstatus, signstatus) ||
                other.signstatus == signstatus) &&
            (identical(other.locationstatus, locationstatus) ||
                other.locationstatus == locationstatus) &&
            (identical(other.credential, credential) ||
                other.credential == credential) &&
            (identical(other.failures, failures) ||
                other.failures == failures) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userstatus, signstatus,
      locationstatus, credential, failures, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            RequestStatus userstatus,
            RequestStatus signstatus,
            LocationStatus locationstatus,
            UserCredential? credential,
            Failures? failures,
            Position? location)
        initial,
  }) {
    return initial(
        userstatus, signstatus, locationstatus, credential, failures, location);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            RequestStatus userstatus,
            RequestStatus signstatus,
            LocationStatus locationstatus,
            UserCredential? credential,
            Failures? failures,
            Position? location)?
        initial,
  }) {
    return initial?.call(
        userstatus, signstatus, locationstatus, credential, failures, location);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            RequestStatus userstatus,
            RequestStatus signstatus,
            LocationStatus locationstatus,
            UserCredential? credential,
            Failures? failures,
            Position? location)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(userstatus, signstatus, locationstatus, credential,
          failures, location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SignUpState {
  const factory _Initial(
      {final RequestStatus userstatus,
      final RequestStatus signstatus,
      final LocationStatus locationstatus,
      final UserCredential? credential,
      final Failures? failures,
      final Position? location}) = _$InitialImpl;

  @override
  RequestStatus get userstatus;
  @override
  RequestStatus get signstatus;
  @override
  LocationStatus get locationstatus;
  @override
  UserCredential? get credential;
  @override
  Failures? get failures;
  @override
  Position? get location;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
