part of 'home_cubit.dart';

class HomeState {
  final int skip;
  final int limit;
  final bool isLoading;
  final UserModel user;
  final GlobalKey listCoinKey;
  final MenuType itemMenuSelected;
  final List<MovieModel> movieList;
  final PageController pageController;
  final ScrollController scrollController;
  final ScrollController scrollControllerFavorite;

  const HomeState({
    required this.skip,
    required this.user,
    required this.limit,
    required this.movieList,
    required this.isLoading,
    required this.listCoinKey,
    required this.pageController,
    required this.itemMenuSelected,
    required this.scrollController,
    required this.scrollControllerFavorite,
  });

  factory HomeState.init() => HomeState(
        skip: 0,
        limit: 10,
        movieList: [],
        isLoading: false,
        user: UserModel.init(),
        listCoinKey: GlobalKey(),
        pageController: PageController(),
        itemMenuSelected: MenuType.ALL_MOVIE,
        scrollController: ScrollController(),
        scrollControllerFavorite: ScrollController(),
      );

  HomeState copyWith({
    int? skip,
    int? limit,
    UserModel? user,
    bool? isLoading,
    MenuType? itemMenuSelected,
    List<MovieModel>? movieList,
  }) =>
      HomeState(
        user: user ?? this.user,
        skip: skip ?? this.skip,
        listCoinKey: listCoinKey,
        limit: limit ?? this.limit,
        pageController: pageController,
        scrollController: scrollController,
        movieList: movieList ?? this.movieList,
        isLoading: isLoading ?? this.isLoading,
        scrollControllerFavorite: scrollControllerFavorite,
        itemMenuSelected: itemMenuSelected ?? this.itemMenuSelected,
      );
}
