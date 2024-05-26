import 'package:dartz/dartz.dart';
import 'package:yo_me_animo/core/errors/failure.dart';
import 'package:yo_me_animo/core/model/user_model.dart';
import 'package:yo_me_animo/core/base/base_usecase.dart';
import 'package:yo_me_animo/features/login/domain/repositories/login_repository.dart';

class GetDataUserUseCase extends BaseUseCase<UserModel, String> {
  GetDataUserUseCase({required this.loginRepository});

  final LoginRepository loginRepository;

  @override
  Future<Either<Failure, UserModel>> call(String params) =>
      loginRepository.getDataUser(params);
}
