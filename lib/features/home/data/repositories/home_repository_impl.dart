import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:yo_me_animo/core/errors/failure.dart';
import 'package:yo_me_animo/core/errors/exceptions.dart';
import 'package:yo_me_animo/core/model/movie_model.dart';
import 'package:yo_me_animo/features/home/data/data_sources/home_data_source.dart';
import 'package:yo_me_animo/features/home/domain/repositories/home_auth_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required this.homeDataSource});

  final HomeDataSource homeDataSource;

  @override
  Future<Either<Failure, List<MovieModel>>> getListMovie() async {
    try {
      final result = await homeDataSource.getListMovies();
      return Right(result);
    } on HomeException catch (e) {
      return Left(HomeFailure(message: e.code));
    }
  }

  @override
  Future<Either<Failure, bool>> saveFavoriteMovie(DocumentReference userRef, int movieSelected) async {
    try {
      final result = await homeDataSource.saveFavoriteMovie(userRef, movieSelected);
      return Right(result);
    } on HomeException catch (e) {
      return Left(HomeFailure(message: e.code));
    }
  }

  @override
  Future<Either<Failure, bool>> removeFavoriteMovie(DocumentReference userRef, int movieSelected) async {
    try {
      final result = await homeDataSource.removeFavoriteMovie(userRef, movieSelected);
      return Right(result);
    } on HomeException catch (e) {
      return Left(HomeFailure(message: e.code));
    }
  }
}
