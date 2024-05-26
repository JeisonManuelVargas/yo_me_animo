 part of 'login_cubit.dart';

class LoginState {
  final bool isLoading;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginState({
    required this.isLoading,
    required this.emailController,
    required this.passwordController,
  });

  factory LoginState.init() => LoginState(
        isLoading: false,
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
      );

  LoginState copyWith({bool? isLoading}) => LoginState(
        emailController: emailController,
        passwordController: passwordController,
        isLoading: isLoading ?? this.isLoading,
      );
}
