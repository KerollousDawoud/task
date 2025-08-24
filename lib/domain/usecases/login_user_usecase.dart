// lib/domain/usecases/login_user_usecase.dart

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/data/auth_repository.dart';

@injectable
class LoginUserUseCase {
  final AuthRepository authRepository;

  LoginUserUseCase(this.authRepository);

  Future<Either<String, void>> call({
    required String email,
    required String password,
  }) async {
    try {
      await authRepository.login(email: email, password: password);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
