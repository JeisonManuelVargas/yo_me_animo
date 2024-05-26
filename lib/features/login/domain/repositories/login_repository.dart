import 'package:dartz/dartz.dart';
import 'package:yo_me_animo/core/errors/failure.dart';
import 'package:yo_me_animo/core/model/user_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, String>> validateUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserModel>> getDataUser(String id);
}
