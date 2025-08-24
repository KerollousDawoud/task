// lib/presentation/screens/register/register_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecases/register_user_usecase.dart';
import 'register_event.dart';
import 'register_state.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUserUseCase registerUserUseCase;

  RegisterBloc(this.registerUserUseCase) : super(RegisterInitial()) {
    on<RegisterSubmitted>((event, emit) async {
      emit(RegisterLoading());
      final result = await registerUserUseCase(
        username: event.username,
        email: event.email,
        password: event.password,
      );

      result.fold(
        (failure) => emit(RegisterFailure(failure)),
        (_) => emit(RegisterSuccess()),
      );
    });
  }
}
