import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yo_me_animo/core/errors/failure.dart';
import 'package:yo_me_animo/core/base/base_usecase.dart';
import 'package:yo_me_animo/features/home/domain/repositories/home_auth_repository.dart';

class RemoveFavoriteMovieUseCase extends BaseUseCase<bool, RemoveFavoriteMovieUseCaseParam> {
  RemoveFavoriteMovieUseCase({required this.homeRepository});

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, bool>> call(RemoveFavoriteMovieUseCaseParam params) =>
      homeRepository.removeFavoriteMovie(params.userRef, params.movieRef);
}

class RemoveFavoriteMovieUseCaseParam {
  final int movieRef;
  final DocumentReference userRef;

  const RemoveFavoriteMovieUseCaseParam({
    required this.userRef,
    required this.movieRef,
  });
}
