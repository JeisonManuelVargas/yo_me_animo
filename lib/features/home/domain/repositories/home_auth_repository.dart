import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:yo_me_animo/core/errors/failure.dart';
import 'package:yo_me_animo/core/model/movie_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<MovieModel>>> getListMovie();
  Future<Either<Failure, bool>> saveFavoriteMovie(DocumentReference userRef, int movieSelected);
  Future<Either<Failure, bool>> removeFavoriteMovie(DocumentReference userRef, int movieSelected);
}
