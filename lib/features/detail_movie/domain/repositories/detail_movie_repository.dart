import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yo_me_animo/core/errors/failure.dart';
import 'package:yo_me_animo/core/model/genres_model.dart';

abstract class DetailMovieRepository {
  Future<Either<Failure, List<GenresModel>>> getListGenres();
  Future<Either<Failure, bool>> saveFavoriteMovie(DocumentReference userRef, int movieSelected);
}
