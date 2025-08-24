part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;
  LoginRequested(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class SignUpRequested extends AuthEvent {
  final String username;
  final String email;
  final String password;
  SignUpRequested(this.username, this.email, this.password);

  @override
  List<Object?> get props => [username, email, password];
}

class ResetPasswordRequested extends AuthEvent {
  final String email;
  ResetPasswordRequested(this.email);

  @override
  List<Object?> get props => [email];
}

class LogoutRequested extends AuthEvent {}

/// ✅ أضفنا Event جديد لجوجل
class GoogleSignInRequested extends AuthEvent {}
