import 'package:go_router/go_router.dart';

import '../../features/auth/view/pages/home_page.dart';
import '../../features/auth/view/pages/login_page.dart';
import '../../features/auth/view/pages/reset_password_page.dart';
import '../../features/auth/view/pages/signup_page.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const LoginPage()),
      GoRoute(path: '/signup', builder: (context, state) => const SignupPage()),
      GoRoute(
        path: '/reset',
        builder: (context, state) => const ResetPasswordPage(),
      ),
      GoRoute(path: '/home', builder: (context, state) => const HomePage()),
    ],
  );
}
