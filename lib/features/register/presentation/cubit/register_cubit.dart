import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yo_me_animo/core/errors/failure.dart';
import 'package:yo_me_animo/core/model/user_model.dart';
import 'package:yo_me_animo/core/navigation/navigator.dart';
import 'package:yo_me_animo/core/util/custom_snack_bar.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:yo_me_animo/features/register/domain/use_case/create_data_user_use_case.dart';
import 'package:yo_me_animo/features/register/domain/use_case/create_user_with_email_and_password_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final CreateDataUserUseCase _createDataUserUseCase;
  final CreateUserWithEmailAndPasswordUseCase
      _createUserWithEmailAndPasswordUseCase;

  RegisterCubit({
    required CreateDataUserUseCase createDataUserUseCase,
    required CreateUserWithEmailAndPasswordUseCase
        createUserWithEmailAndPasswordUseCase,
  })  : _createDataUserUseCase = createDataUserUseCase,
        _createUserWithEmailAndPasswordUseCase =
            createUserWithEmailAndPasswordUseCase,
        super(RegisterState.init());

  init() => FlutterNativeSplash.remove();

  saveUser(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    final result = await _createUserWithEmailAndPasswordUseCase(
      RegisterWithEmailPasswordParams(
        email: state.emailController.text,
        password: state.passwordController.text,
      ),
    );
    result.fold(
      (Failure l) => customSnackBar(context, content: l.message),
      (String r) async => _saveUserData(context, r),
    );

    emit(state.copyWith(isLoading: false));
  }

  _saveUserData(BuildContext context, String id) async {
    emit(state.copyWith(isLoading: true));
    final result = await _createDataUserUseCase(CreateDataUserUseCaseParams(
      id: id,
      userModel: UserModel(
        name: state.nameController.text,
        email: state.emailController.text,
      ),
    ));
    result.fold(
      (Failure l) => customSnackBar(context, content: l.message),
      (UserModel r) async => _goToHome(r),
    );
    emit(state.copyWith(isLoading: false));
  }

  _goToHome(UserModel user) =>
      AppNavigator.pushNamedAndRemoveUntil(Routes.HOME, arguments: user);

  goToLogin() =>
      AppNavigator.pushNamedAndRemoveUntil(Routes.LOGIN);

  @override
  Future<void> close() {
    state.emailController.dispose();
    state.nameController.dispose();
    state.passwordController.dispose();
    return super.close();
  }
}
