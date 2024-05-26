import 'package:flutter/material.dart';
import 'package:yo_me_animo/core/util/app_color.dart';
import 'package:yo_me_animo/injection_container.dart';
import 'package:yo_me_animo/core/base/base_page.dart';
import 'package:yo_me_animo/core/util/app_text_style.dart';
import 'package:yo_me_animo/core/widget/custom_input.dart';
import 'package:yo_me_animo/core/widget/custom_button.dart';
import 'package:yo_me_animo/core/extension/context_extension.dart';
import 'package:yo_me_animo/features/login/presentation/cubit/login_cubit.dart';

class Login extends BasePage<LoginState, LoginCubit> {

  const Login({super.key});

  @override
  LoginCubit createBloc(BuildContext context) => sl<LoginCubit>()..init();

  @override
  Widget buildPage(BuildContext context, state, bloc) {
    return Scaffold(
      backgroundColor: AppColors.second,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: context.sizeWidth(0.05)),
        children: [
          SizedBox(height: context.sizeHeight(0.15)),
          Text(
            "Iniciar sesión",
            style: AppTextStyle().h1Title,
          ),
          Text(
            "Regístrate y conoce todo sobre los últimos estrenos",
            style: AppTextStyle().buttonStyle,
          ),
          SizedBox(height: context.sizeHeight(0.05)),
          CustomInput(
            label: "Email",
            icon: Icons.email_outlined,
            controller: state.emailController,
          ),
          SizedBox(height: context.sizeHeight(0.05)),
          CustomInput(
            icon: Icons.lock_outlined,
            label: "Contraseña",
            controller: state.passwordController,
          ),
          SizedBox(height: context.sizeHeight(0.1)),
          state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : CustomButton(
                  label: "Iniciar",
                  verticalPadding: 10,
                  onTap: () => bloc.validateUser(context),
                ),
          SizedBox(height: context.sizeHeight(0.06)),
          InkWell(
            onTap: bloc.goToRegister,
            child: Text(
              "No tengo una cuenta",
              textAlign: TextAlign.center,
              style: AppTextStyle().buttonStyle,
            ),
          )
        ],
      ),
    );
  }
}
