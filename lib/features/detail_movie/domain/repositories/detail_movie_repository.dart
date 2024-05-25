import 'package:dartz/dartz.dart';
import 'package:yo_me_animo/core/errors/failure.dart';
import 'package:yo_me_animo/core/model/genres_model.dart';

abstract class DetailMovieRepository {
  Future<Either<Failure, List<GenresModel>>> getListGenres();
}
