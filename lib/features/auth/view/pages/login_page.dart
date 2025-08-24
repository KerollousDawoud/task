import 'package:auth_task/features/auth/bloc/auth_bloc.dart';
import 'package:auth_task/features/auth/bloc/login/login_bloc.dart';
import 'package:auth_task/features/auth/bloc/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:go_router/go_router.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is LoginSuccess) {
            context.push('/home');
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CustomTextField(controller: emailController, hintText: "Email"),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                CustomButton(
                  text: "Login",
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      LoginRequested(
                        emailController.text,
                        passwordController.text,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                SignInButton(
                  Buttons.Google,
                  text: "Continue with Google",
                  onPressed: () {
                    context.read<AuthBloc>().add(GoogleSignInRequested());
                  },
                ),
                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don’t have an account? "),
                    TextButton(
                      onPressed: () {
                        context.push('/signup');
                      },
                      child: const Text("Sign up"),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    context.push('/reset');
                  },
                  child: const Text("Forgot Password?"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
