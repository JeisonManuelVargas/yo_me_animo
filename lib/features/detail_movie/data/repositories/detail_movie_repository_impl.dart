import 'package:dartz/dartz.dart';
import 'package:yo_me_animo/core/errors/failure.dart';
import 'package:yo_me_animo/core/errors/exceptions.dart';
import 'package:yo_me_animo/core/model/genres_model.dart';
import 'package:yo_me_animo/features/detail_movie/data/data_sources/detail_movie_data_source.dart';
import 'package:yo_me_animo/features/detail_movie/domain/repositories/detail_movie_repository.dart';

class DetailMovieRepositoryImpl implements DetailMovieRepository {
  DetailMovieRepositoryImpl({required this.detailMovieDataSource});

  final DetailMovieDataSource detailMovieDataSource;

  @override
  Future<Either<Failure, List<GenresModel>>> getListGenres() async {
    try {
      final result = await detailMovieDataSource.getListGenres();
      return Right(result);
    } on DetailMovieException catch (e) {
      return Left(DetailMovieFailure(message: e.code));
    }
  }
}
