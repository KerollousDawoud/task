// lib/presentation/screens/reset_password/reset_password_bloc.dart

import 'package:auth_task/features/auth/bloc/reset_password/resetpassword_event.dart';
import 'package:auth_task/features/auth/bloc/reset_password/resetpassword_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecases/reset_password_usecase.dart';

@injectable
class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final ResetPasswordUseCase resetPasswordUseCase;

  ResetPasswordBloc(this.resetPasswordUseCase) : super(ResetPasswordInitial()) {
    on<ResetPasswordSubmitted>((event, emit) async {
      emit(ResetPasswordLoading());
      final result = await resetPasswordUseCase(email: event.email);

      result.fold(
        (failure) => emit(ResetPasswordFailure(failure)),
        (_) => emit(ResetPasswordSuccess()),
      );
    });
  }
}
