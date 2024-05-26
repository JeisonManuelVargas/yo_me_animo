import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yo_me_animo/core/model/user_model.dart';
import 'package:yo_me_animo/core/base/base_usecase.dart';
import 'package:yo_me_animo/core/model/movie_model.dart';
import 'package:yo_me_animo/core/navigation/navigator.dart';
import 'package:yo_me_animo/core/util/custom_snack_bar.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:yo_me_animo/features/detail_movie/data/model/detail_page_model.dart';
import 'package:yo_me_animo/features/home/data/model/menu_type.dart';
import 'package:yo_me_animo/features/home/domain/usecases/get_coin_list_use_case.dart';
import 'package:yo_me_animo/features/home/domain/usecases/remove_favorite_movie_use_case.dart';
import 'package:yo_me_animo/features/home/domain/usecases/save_favorite_movie_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetMovieListUseCase _getMovieListUseCase;
  final SaveFavoriteMovieUseCase _saveFavoriteMovieUseCase;
  final RemoveFavoriteMovieUseCase _removeFavoriteMovieUseCase;

  HomeCubit({
    required GetMovieListUseCase getCoinListUseCase,
    required SaveFavoriteMovieUseCase saveFavoriteMovieUseCase,
    required RemoveFavoriteMovieUseCase removeFavoriteMovieUseCase,
  })  : _saveFavoriteMovieUseCase = saveFavoriteMovieUseCase,
        _removeFavoriteMovieUseCase = removeFavoriteMovieUseCase,
        _getMovieListUseCase = getCoinListUseCase,
        super(HomeState.init());

  init(BuildContext context, UserModel user) {
    FlutterNativeSplash.remove();
    getMovieList(context: context);
    emit(state.copyWith(user: user));
  }

  getMovieList({required BuildContext context}) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getMovieListUseCase(NoParams());
    result.fold(
      (dynamic l) {
        emit(state.copyWith(isLoading: false));
        customSnackBar(context, content: l.code);
      },
      (r) async {
        emit(state.copyWith(
          movieList: r,
          isLoading: false,
          skip: state.limit,
          limit: state.limit + 10,
        ));
      },
    );
  }

  void changeListView(MenuType key) {
    if (key == MenuType.ALL_MOVIE) {
      state.pageController.animateToPage(
        0,
        curve: Curves.linear,
        duration: const Duration(milliseconds: 400),
      );
    }
    if (key == MenuType.FAVORITE) {
      state.pageController.animateToPage(
        1,
        curve: Curves.linear,
        duration: const Duration(milliseconds: 400),
      );
    }

    emit(state.copyWith(itemMenuSelected: key));
  }

  void onTapCard(BuildContext context, MovieModel movie) {
    bool haveCoin = state.user.favoriteMovies.contains(movie.id);
    if (haveCoin) {
      _removeFavoriteMovie(context, movie.id);
    }
    if (!haveCoin) {
      _saveFavoriteMovie(context, movie.id);
    }
    emit(state.copyWith());
  }

  _saveFavoriteMovie(BuildContext context, int movieRef) async {
    emit(state.copyWith(isLoading: true));
    final result =
        await _saveFavoriteMovieUseCase(SaveFavoriteMovieUseCaseParam(
      userRef: state.user.id!,
      movieRef: movieRef,
    ));

    result.fold((dynamic l) {
      emit(state.copyWith(isLoading: false));
      customSnackBar(context, content: l.code);
    }, (r) async => state.user.favoriteMovies.add(movieRef));
    emit(state.copyWith(isLoading: false));
  }

  _removeFavoriteMovie(BuildContext context, int movieRef) async {
    emit(state.copyWith(isLoading: true));
    final result =
        await _removeFavoriteMovieUseCase(RemoveFavoriteMovieUseCaseParam(
      userRef: state.user.id!,
      movieRef: movieRef,
    ));

    result.fold((dynamic l) {
      emit(state.copyWith(isLoading: false));
      customSnackBar(context, content: l.code);
    }, (r) async => state.user.favoriteMovies.remove(movieRef));

    emit(state.copyWith(isLoading: false));
  }

  void onTapButton(MovieModel movie) => AppNavigator.push(Routes.DETAIL_MOVIE,
      arguments: DetailPageModel(
        movie: movie,
        userModel: state.user,
      ));

  bool validateIsFavorite(MovieModel movie) =>
      state.user.favoriteMovies.contains(movie.id);
}
