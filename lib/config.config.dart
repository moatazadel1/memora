// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/api/api_manager.dart' as _i3;
import 'core/Firebase/firebase_functions.dart' as _i4;
import 'core/Location/location.dart' as _i5;
import 'features/Login/data/data_sources/loginDs.dart' as _i6;
import 'features/Login/data/data_sources/LoginDsImp.dart' as _i7;
import 'features/Login/data/repositories/loginRepoImp.dart' as _i9;
import 'features/Login/domain/entities/LoginRepo.dart' as _i8;
import 'features/Login/domain/use_cases/LoginUseCase.dart' as _i10;
import 'features/Login/presentation/bloc/login_bloc.dart' as _i22;
import 'features/News/data/data_sources/RemoteDs/NewsDs.dart' as _i11;
import 'features/News/data/data_sources/RemoteDs/NewsModelImp.dart' as _i12;
import 'features/News/data/repositories/newsRepoImp.dart' as _i14;
import 'features/News/domain/repositories/newsRepo.dart' as _i13;
import 'features/News/domain/use_cases/news_usecase.dart' as _i15;
import 'features/News/presentation/bloc/news_bloc.dart' as _i23;
import 'features/signUp/data/data_sources/remoteDs/SignUpDs.dart' as _i16;
import 'features/signUp/data/data_sources/remoteDs/SignUpDsImp.dart' as _i17;
import 'features/signUp/data/repositories/SignUpRepoImp.dart' as _i19;
import 'features/signUp/domain/repositories/SignUpRepo.dart' as _i18;
import 'features/signUp/domain/use_cases/signUp_useCase.dart' as _i20;
import 'features/signUp/domain/use_cases/storeuserUseCase.dart' as _i21;
import 'features/signUp/presentation/manager/sign_up_bloc.dart' as _i24;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.FirebaseFunctions>(() => _i4.FirebaseFunctions());
    gh.factory<_i5.GetCurrentLocation>(() => _i5.GetCurrentLocation());
    gh.factory<_i6.LoginDs>(() => _i7.LoginDsImp(gh<_i4.FirebaseFunctions>()));
    gh.factory<_i8.LoginRepo>(() => _i9.LoginRepoImp(gh<_i6.LoginDs>()));
    gh.factory<_i10.LoginUseCase>(() => _i10.LoginUseCase(gh<_i8.LoginRepo>()));
    gh.factory<_i11.NewsDs>(() => _i12.NewsDsImp(gh<_i3.ApiManager>()));
    gh.factory<_i13.NewsRepo>(() => _i14.NewsRepoImp(gh<_i11.NewsDs>()));
    gh.factory<_i15.NewsUseCase>(() => _i15.NewsUseCase(gh<_i13.NewsRepo>()));
    gh.factory<_i16.SignUpDs>(
        () => _i17.SignUpDsImp(gh<_i4.FirebaseFunctions>()));
    gh.factory<_i18.SignUpRepo>(() => _i19.SignUpRepoImp(gh<_i16.SignUpDs>()));
    gh.factory<_i20.SignUpUseCase>(
        () => _i20.SignUpUseCase(gh<_i18.SignUpRepo>()));
    gh.factory<_i21.StoreUserUseCase>(
        () => _i21.StoreUserUseCase(gh<_i18.SignUpRepo>()));
    gh.factory<_i22.LoginBloc>(() => _i22.LoginBloc(gh<_i10.LoginUseCase>()));
    gh.factory<_i23.NewsBloc>(() => _i23.NewsBloc(gh<_i15.NewsUseCase>()));
    gh.factory<_i24.SignUpBloc>(() => _i24.SignUpBloc(
          gh<_i5.GetCurrentLocation>(),
          gh<_i20.SignUpUseCase>(),
          gh<_i21.StoreUserUseCase>(),
        ));
    return this;
  }
}
