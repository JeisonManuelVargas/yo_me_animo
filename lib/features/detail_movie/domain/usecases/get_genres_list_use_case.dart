import 'package:dartz/dartz.dart';
import 'package:yo_me_animo/core/base/base_usecase.dart';
import 'package:yo_me_animo/core/errors/failure.dart';
import 'package:yo_me_animo/core/model/genres_model.dart';
import 'package:yo_me_animo/features/detail_movie/domain/repositories/detail_movie_repository.dart';


class GetListGenresUseCase extends BaseUseCase<List<GenresModel>, NoParams> {
  GetListGenresUseCase({required this.detailMovieRepository});

  final DetailMovieRepository detailMovieRepository;

  @override
  Future<Either<Failure, List<GenresModel>>> call(NoParams params) =>
      detailMovieRepository.getListGenres();
}
