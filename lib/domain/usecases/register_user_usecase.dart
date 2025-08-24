// lib/domain/usecases/register_user_usecase.dart

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/data/auth_repository.dart';

@injectable
class RegisterUserUseCase {
  final AuthRepository authRepository;

  RegisterUserUseCase(this.authRepository);

  Future<Either<String, void>> call({
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      await authRepository.signUp(
        username: username,
        email: email,
        password: password,
      );
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
