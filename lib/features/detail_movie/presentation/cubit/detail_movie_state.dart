part of 'detail_movie_cubit.dart';

class DetailMovieState {
  final MovieModel movie;
  final List<GenresModel> genres;
  final List<MovieModel> movieList;
  final List<MovieModel> secondMovieList;
  final ScrollController controller;

  const DetailMovieState({
    required this.movie,
    required this.genres,
    required this.movieList,
    required this.secondMovieList,
    required this.controller,
  });

  factory DetailMovieState.init() => DetailMovieState(
        genres: [],
        movieList: [],
        secondMovieList: [],
        movie: MovieModel.init(),
        controller: ScrollController(),
      );

  DetailMovieState copyWith({
    MovieModel? movie,
    List<GenresModel>? genres,
    List<MovieModel>? movieList,
    List<MovieModel>? secondMovieList,
  }) =>
      DetailMovieState(
        movie: movie ?? this.movie,
        genres: genres ?? this.genres,
        controller: ScrollController(),
        movieList: movieList ?? this.movieList,
        secondMovieList: secondMovieList ?? this.secondMovieList,
      );
}
