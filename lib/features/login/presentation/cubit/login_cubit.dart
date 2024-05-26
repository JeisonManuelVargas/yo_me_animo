import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yo_me_animo/core/errors/failure.dart';
import 'package:yo_me_animo/core/model/user_model.dart';
import 'package:yo_me_animo/core/navigation/navigator.dart';
import 'package:yo_me_animo/core/util/custom_snack_bar.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:yo_me_animo/features/login/domain/use_case/get_data_user_use_case.dart';
import 'package:yo_me_animo/features/login/domain/use_case/validate_user_with_email_and_password_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final GetDataUserUseCase _getDataUserUseCase;
  final ValidateUserWithEmailAndPasswordUseCase _validateUserWithEmailAndPasswordUseCase;

  LoginCubit({
    required GetDataUserUseCase getDataUserUseCase,
    required ValidateUserWithEmailAndPasswordUseCase validateUserWithEmailAndPasswordUseCase,
  })  : _getDataUserUseCase = getDataUserUseCase,
        _validateUserWithEmailAndPasswordUseCase = validateUserWithEmailAndPasswordUseCase,
        super(LoginState.init());

  init() => FlutterNativeSplash.remove();

  validateUser(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    final result = await _validateUserWithEmailAndPasswordUseCase(ValidateEmailParams(email: state.emailController.text, password: state.passwordController.text));
    result.fold(
      (Failure l) => customSnackBar(context, content: l.message),
      (String r) async => _getUserData(context, r),
    );
    emit(state.copyWith(isLoading: false));
  }

  _getUserData(BuildContext context, String id) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getDataUserUseCase(id);
    result.fold(
      (Failure l) => customSnackBar(context, content: l.message),
      (UserModel r) async => _goToHome(r),
    );
    emit(state.copyWith(isLoading: false));
  }

  _goToHome(UserModel user) =>
      AppNavigator.pushNamedAndRemoveUntil(Routes.HOME, arguments: user);

  goToRegister() =>
      AppNavigator.pushNamedAndRemoveUntil(Routes.REGISTER);

  @override
  Future<void> close() {
    state.emailController.dispose();
    state.passwordController.dispose();
    return super.close();
  }
}
