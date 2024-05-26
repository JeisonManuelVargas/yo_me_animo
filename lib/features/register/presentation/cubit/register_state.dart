 part of 'register_cubit.dart';

class RegisterState {
  final bool isLoading;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const RegisterState({
    required this.isLoading,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  factory RegisterState.init() => RegisterState(
        isLoading: false,
        nameController: TextEditingController(),
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
      );

  RegisterState copyWith({bool? isLoading}) => RegisterState(
        nameController: nameController,
        emailController: emailController,
        passwordController: passwordController,
        isLoading: isLoading ?? this.isLoading,
      );
}
