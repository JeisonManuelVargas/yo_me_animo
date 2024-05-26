import 'package:dartz/dartz.dart';
import 'package:yo_me_animo/core/errors/failure.dart';
import 'package:yo_me_animo/core/model/user_model.dart';
import 'package:yo_me_animo/core/base/base_usecase.dart';
import 'package:yo_me_animo/features/register/domain/repositories/validate_phone_number_repository.dart';

class CreateDataUserUseCase extends BaseUseCase<UserModel, CreateDataUserUseCaseParams> {
  CreateDataUserUseCase({required this.registerRepository});

  final RegisterRepository registerRepository;

  @override
  Future<Either<Failure, UserModel>> call(CreateDataUserUseCaseParams params) =>
      registerRepository.createDataUser(
        id: params.id,
        userModel: params.userModel,
      );
}

class CreateDataUserUseCaseParams{

  final UserModel userModel;
  final String id;

  CreateDataUserUseCaseParams({required this.userModel, required this.id});
}
