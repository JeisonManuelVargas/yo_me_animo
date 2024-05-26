import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yo_me_animo/core/model/user_model.dart';
import 'package:yo_me_animo/core/base/base_usecase.dart';
import 'package:yo_me_animo/core/model/movie_model.dart';
import 'package:yo_me_animo/core/model/genres_model.dart';
import 'package:yo_me_animo/core/navigation/navigator.dart';
import 'package:yo_me_animo/core/util/custom_snack_bar.dart';
import 'package:yo_me_animo/features/detail_movie/data/model/detail_page_model.dart';
import 'package:yo_me_animo/features/home/domain/usecases/get_coin_list_use_case.dart';
import 'package:yo_me_animo/features/detail_movie/domain/usecases/get_genres_list_use_case.dart';
import 'package:yo_me_animo/features/detail_movie/domain/usecases/detail_save_favorite_movie_use_case.dart';

part 'detail_movie_state.dart';

class DetailMovieCubit extends Cubit<DetailMovieState> {
  final GetMovieListUseCase _getMovieListUseCase;
  final GetListGenresUseCase _getListGenresUseCase;
  final DetailSaveFavoriteMovieUseCase _detailSaveFavoriteMovieUseCase;

  DetailMovieCubit({
    required GetMovieListUseCase getMovieListUseCase,
    required GetListGenresUseCase getListGenresUseCase,
    required DetailSaveFavoriteMovieUseCase detailSaveFavoriteMovieUseCase,
  })  : _getMovieListUseCase = getMovieListUseCase,
        _getListGenresUseCase = getListGenresUseCase,
        _detailSaveFavoriteMovieUseCase = detailSaveFavoriteMovieUseCase,
        super(DetailMovieState.init());

  init(
    BuildContext context, {
    required DetailPageModel detailPageModel
  }) {
    _getGenresList(context: context);
    _getMovieList(context: context);
    emit(state.copyWith(movie: detailPageModel.movie, user: detailPageModel.userModel));
  }

  _getGenresList({required BuildContext context}) async {
    final result = await _getListGenresUseCase(NoParams());
    result.fold(
      (dynamic l) => customSnackBar(context, content: l.code),
      (r) async => emit(state.copyWith(genres: r)),
    );
  }

  _getMovieList({required BuildContext context}) async {
    final result = await _getMovieListUseCase(NoParams());
    result.fold((dynamic l) => customSnackBar(context, content: l.code),
        (r) async {
      List<MovieModel> newList = r.toList();
      newList.sort((a, b) => a.id.compareTo(b.id));
      emit(state.copyWith(movieList: r, secondMovieList: newList));
    });
  }

  saveFavoriteMovie(BuildContext context, int movieRef) async {
    if(!state.user.favoriteMovies.contains(movieRef)){
      final result = await _detailSaveFavoriteMovieUseCase(DetailSaveFavoriteMovieUseCaseParam(
        movieRef: movieRef,
        userRef: state.user.id!,
      ));
      result.fold(
            (dynamic l) => customSnackBar(context, content: l.code),
            (r) async => state.user.favoriteMovies.add(movieRef),
      );
      emit(state.copyWith());
    }else{
      customSnackBar(context, content: "Si no lo quieres tener en favoritos es necesario que vayas a las listas");
    }
  }

  String handledFindGenreName(int id) => state.genres.firstWhere((element) => element.id == id, orElse: () => GenresModel.init()).name;

  void onTapButton(MovieModel movie) => AppNavigator.push(Routes.DETAIL_MOVIE,
      arguments: DetailPageModel(
        movie: movie,
        userModel: state.user,
      ));
}
