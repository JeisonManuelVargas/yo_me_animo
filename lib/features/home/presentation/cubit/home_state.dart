part of 'home_cubit.dart';

class HomeState {
  final int skip;
  final int limit;
  final bool isLoading;
  final GlobalKey listCoinKey;
  final List<MovieModel> movieList;
  final PageController pageController;
  final List<MovieModel> movieListFavorite;
  final ScrollController scrollController;
  final ScrollController scrollControllerFavorite;

  const HomeState({
    required this.skip,
    required this.limit,
    required this.movieList,
    required this.isLoading,
    required this.listCoinKey,
    required this.pageController,
    required this.scrollController,
    required this.movieListFavorite,
    required this.scrollControllerFavorite,
  });

  factory HomeState.init() => HomeState(
        skip: 0,
        limit: 10,
        movieList: [],
        isLoading: false,
        movieListFavorite: [],
        listCoinKey: GlobalKey(),
        pageController: PageController(),
        scrollController: ScrollController(),
        scrollControllerFavorite: ScrollController(),
      );

  HomeState copyWith({
    int? skip,
    int? limit,
    bool? isLoading,
    List<MovieModel>? movieList,
    List<MovieModel>? movieListFavorite,
  }) =>
      HomeState(
        skip: skip ?? this.skip,
        listCoinKey: listCoinKey,
        limit: limit ?? this.limit,
        pageController: pageController,
        scrollController: scrollController,
        movieList: movieList ?? this.movieList,
        isLoading: isLoading ?? this.isLoading,
        scrollControllerFavorite: scrollControllerFavorite,
        movieListFavorite: movieListFavorite ?? this.movieListFavorite,
      );
}
