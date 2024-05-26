import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yo_me_animo/core/errors/failure.dart';
import 'package:yo_me_animo/core/model/user_model.dart';
import 'package:yo_me_animo/features/register/data/data_sources/register_data_source.dart';
import 'package:yo_me_animo/features/register/domain/repositories/validate_phone_number_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  RegisterRepositoryImpl({required this.registerDataSource});

  final RegisterDataSource registerDataSource;

  @override
  Future<Either<Failure, String>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await registerDataSource.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(RegisterFailure(message: e.code));
    }
  }

  @override
  Future<Either<Failure, UserModel>> createDataUser({
    required String id,
    required UserModel userModel,
  }) async {
    try {
      final result = await registerDataSource.createDataUser(
        id: id,
        userModel: userModel,
      );
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(RegisterFailure(message: e.code));
    }
  }
}
