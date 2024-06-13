import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/enums/enums.dart';
import '../../../../core/failures/failures.dart';
import '../../domain/use_cases/LoginUseCase.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';
@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUseCase loginUseCase;
  LoginBloc(this.loginUseCase) : super(const LoginState.initial()) {
   on<LOgin>((event, emit)async {
     var result=await loginUseCase.call(event.email, event.password);
     result.fold((l) => emit(
       state.copyWith(
         status: RequestStatus.success,
         credential: l
       )
     ), (r) => emit(
       state.copyWith(
         status: RequestStatus.failure,
         failures: r
       )
     ));
   });
  }
}
