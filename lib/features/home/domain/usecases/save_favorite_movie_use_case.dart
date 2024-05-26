import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yo_me_animo/core/errors/failure.dart';
import 'package:yo_me_animo/core/base/base_usecase.dart';
import 'package:yo_me_animo/features/home/domain/repositories/home_auth_repository.dart';

class SaveFavoriteMovieUseCase extends BaseUseCase<bool, SaveFavoriteMovieUseCaseParam> {
  SaveFavoriteMovieUseCase({required this.homeRepository});

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, bool>> call(SaveFavoriteMovieUseCaseParam params) =>
      homeRepository.saveFavoriteMovie(params.userRef, params.movieRef);
}

class SaveFavoriteMovieUseCaseParam {
  final int movieRef;
  final DocumentReference userRef;

  const SaveFavoriteMovieUseCaseParam({
    required this.userRef,
    required this.movieRef,
  });
}
