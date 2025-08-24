// lib/presentation/screens/login/login_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecases/login_user_usecase.dart';
import 'login_event.dart';
import 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUserUseCase loginUserUseCase;

  LoginBloc(this.loginUserUseCase) : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      final result = await loginUserUseCase(
        email: event.email,
        password: event.password,
      );

      result.fold(
        (failure) => emit(LoginFailure(failure)),
        (_) => emit(LoginSuccess()),
      );
    });
  }
}
