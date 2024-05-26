import 'package:flutter/material.dart';
import 'package:yo_me_animo/core/util/app_color.dart';
import 'package:yo_me_animo/injection_container.dart';
import 'package:yo_me_animo/core/base/base_page.dart';
import 'package:yo_me_animo/core/util/app_text_style.dart';
import 'package:yo_me_animo/core/widget/custom_input.dart';
import 'package:yo_me_animo/core/widget/custom_button.dart';
import 'package:yo_me_animo/core/extension/context_extension.dart';
import 'package:yo_me_animo/features/register/presentation/cubit/register_cubit.dart';

class Register extends BasePage<RegisterState, RegisterCubit> {
  const Register({super.key});

  @override
  RegisterCubit createBloc(BuildContext context) => sl<RegisterCubit>()..init();

  @override
  Widget buildPage(BuildContext context, state, bloc) {
    return Scaffold(
      backgroundColor: AppColors.second,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: context.sizeWidth(0.05)),
        children: [
          SizedBox(height: context.sizeHeight(0.15)),
          Text(
            "Registrate",
            style: AppTextStyle().h1Title,
          ),
          Text(
            "Regístrate y conoce todo sobre los últimos estrenos",
            style: AppTextStyle().buttonStyle,
          ),
          SizedBox(height: context.sizeHeight(0.05)),
          CustomInput(
            icon: Icons.account_circle_outlined,
            label: "Nombre",
            controller: state.nameController,
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
                  label: "Registrarte",
                  verticalPadding: 10,
                  onTap: () => bloc.saveUser(context),
                ),
          SizedBox(height: context.sizeHeight(0.06)),
          InkWell(
            onTap: bloc.goToLogin,
            child: Text(
              "Ya tengo una cuenta",
              textAlign: TextAlign.center,
              style: AppTextStyle().buttonStyle,
            ),
          )
        ],
      ),
    );
  }
}
