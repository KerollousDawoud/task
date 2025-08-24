// lib/domain/usecases/reset_password_usecase.dart

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/data/auth_repository.dart';

@injectable
class ResetPasswordUseCase {
  final AuthRepository authRepository;

  ResetPasswordUseCase(this.authRepository);

  Future<Either<String, void>> call({required String email}) async {
    try {
      await authRepository.resetPassword(email: email);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
