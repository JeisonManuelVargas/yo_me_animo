import 'package:dartz/dartz.dart';
import 'package:yo_me_animo/core/errors/failure.dart';
import 'package:yo_me_animo/core/model/movie_model.dart';
import 'package:yo_me_animo/core/base/base_usecase.dart';
import 'package:yo_me_animo/features/home/domain/repositories/home_auth_repository.dart';


class GetMovieListUseCase extends BaseUseCase<List<MovieModel>, NoParams> {
  GetMovieListUseCase({required this.homeRepository});

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, List<MovieModel>>> call(NoParams params) =>
      homeRepository.getListMovie();
}
