import 'package:dartz/dartz.dart';
import 'package:yo_me_animo/core/errors/failure.dart';
import 'package:yo_me_animo/core/base/base_usecase.dart';
import 'package:yo_me_animo/features/register/domain/repositories/validate_phone_number_repository.dart';

class CreateUserWithEmailAndPasswordUseCase extends BaseUseCase<String, RegisterWithEmailPasswordParams> {
  CreateUserWithEmailAndPasswordUseCase({required this.registerRepository});

  final RegisterRepository registerRepository;

  @override
  Future<Either<Failure, String>> call(RegisterWithEmailPasswordParams params) =>
      registerRepository.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
}

class RegisterWithEmailPasswordParams {
  RegisterWithEmailPasswordParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
