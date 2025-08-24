// lib/presentation/screens/reset_password/reset_password_event.dart

abstract class ResetPasswordEvent {}

class ResetPasswordSubmitted extends ResetPasswordEvent {
  final String email;

  ResetPasswordSubmitted({required this.email});
}
