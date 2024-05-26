import 'package:dartz/dartz.dart';
import 'package:yo_me_animo/core/errors/failure.dart';
import 'package:yo_me_animo/core/base/base_usecase.dart';
import 'package:yo_me_animo/features/login/domain/repositories/login_repository.dart';

class ValidateUserWithEmailAndPasswordUseCase extends BaseUseCase<String, ValidateEmailParams> {
  ValidateUserWithEmailAndPasswordUseCase({required this.loginRepository});

  final LoginRepository loginRepository;

  @override
  Future<Either<Failure, String>> call(ValidateEmailParams params) =>
      loginRepository.validateUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
}

class ValidateEmailParams {
  ValidateEmailParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
