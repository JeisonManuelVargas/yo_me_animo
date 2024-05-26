import 'package:dartz/dartz.dart';
import 'package:yo_me_animo/core/errors/failure.dart';
import 'package:yo_me_animo/core/model/user_model.dart';

abstract class RegisterRepository {
  Future<Either<Failure, String>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserModel>> createDataUser({
    required String id,
    required UserModel userModel,
  });
}
