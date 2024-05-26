part of 'detail_movie_cubit.dart';

class DetailMovieState {
  final UserModel user;
  final MovieModel movie;
  final List<GenresModel> genres;
  final List<MovieModel> movieList;
  final ScrollController controller;
  final List<MovieModel> secondMovieList;

  const DetailMovieState({
    required this.user,
    required this.movie,
    required this.genres,
    required this.movieList,
    required this.controller,
    required this.secondMovieList,
  });

  factory DetailMovieState.init() => DetailMovieState(
        genres: [],
        movieList: [],
        secondMovieList: [],
        user: UserModel.init(),
        movie: MovieModel.init(),
        controller: ScrollController(),
      );

  DetailMovieState copyWith({
    MovieModel? movie,
    UserModel? user,
    List<GenresModel>? genres,
    List<MovieModel>? movieList,
    List<MovieModel>? secondMovieList,
  }) =>
      DetailMovieState(
        user: user ?? this.user,
        movie: movie ?? this.movie,
        genres: genres ?? this.genres,
        controller: ScrollController(),
        movieList: movieList ?? this.movieList,
        secondMovieList: secondMovieList ?? this.secondMovieList,
      );
}
