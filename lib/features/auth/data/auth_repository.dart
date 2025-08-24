// lib/features/auth/data/auth_repository.dart
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final SupabaseClient _supabase;

  AuthRepository(this._supabase);

  /// ✅ Sign Up
  Future<AuthResponse> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await _supabase.auth.signUp(
      email: email,
      password: password,
      data: {'username': username},
    );
    return response;
  }

  /// ✅ Login with Email/Password
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return response;
  }

  /// ✅ Reset Password
  Future<void> resetPassword({required String email}) async {
    await _supabase.auth.resetPasswordForEmail(email);
  }

  /// ✅ Logout
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  /// ✅ Google Sign-In
  Future<void> signInWithGoogle() async {
    await _supabase.auth.signInWithOAuth(OAuthProvider.google);
  }

  /// ✅ Current session getter
  Session? get currentSession => _supabase.auth.currentSession;
}
