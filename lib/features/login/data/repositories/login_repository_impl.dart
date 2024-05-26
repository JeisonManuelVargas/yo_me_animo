import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yo_me_animo/core/errors/failure.dart';
import 'package:yo_me_animo/core/model/user_model.dart';
import 'package:yo_me_animo/features/login/data/data_sources/login_data_source.dart';
import 'package:yo_me_animo/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({required this.loginDataSource});

  final LoginDataSource loginDataSource;

  @override
  Future<Either<Failure, String>> validateUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await loginDataSource.validateUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(LoginFailure(message: e.code));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getDataUser(String id) async {
    try {
      final result = await loginDataSource.getDataUser(id: id);
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(LoginFailure(message: e.code));
    }
  }
}
