part of 'detail_movie_cubit.dart';

class DetailMovieState {
  final MovieModel movie;
  final List<GenresModel> genres;
  final List<MovieModel> movieList;

  const DetailMovieState({
    required this.movie,
    required this.genres,
    required this.movieList,
  });

  factory DetailMovieState.init() => DetailMovieState(
        genres: [],
        movie: MovieModel.init(),
        movieList: [],
      );

  DetailMovieState copyWith({
    MovieModel? movie,
    List<MovieModel>? movieList,
    List<GenresModel>? genres,
  }) =>
      DetailMovieState(
        movie: movie ?? this.movie,
        genres: genres ?? this.genres,
        movieList: movieList ?? this.movieList,
      );
}
