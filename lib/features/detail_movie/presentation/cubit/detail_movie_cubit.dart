import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yo_me_animo/core/base/base_usecase.dart';
import 'package:yo_me_animo/core/model/genres_model.dart';
import 'package:yo_me_animo/core/model/movie_model.dart';
import 'package:yo_me_animo/core/navigation/navigator.dart';
import 'package:yo_me_animo/core/util/custom_snack_bar.dart';
import 'package:yo_me_animo/features/detail_movie/domain/usecases/get_genres_list_use_case.dart';
import 'package:yo_me_animo/features/home/domain/usecases/get_coin_list_use_case.dart';

part 'detail_movie_state.dart';

class DetailMovieCubit extends Cubit<DetailMovieState> {
  final GetMovieListUseCase _getMovieListUseCase;
  final GetListGenresUseCase _getListGenresUseCase;

  DetailMovieCubit({
    required GetListGenresUseCase getListGenresUseCase,
    required GetMovieListUseCase getMovieListUseCase,
  })  : _getListGenresUseCase = getListGenresUseCase,
        _getMovieListUseCase = getMovieListUseCase,
        super(DetailMovieState.init());

  init(BuildContext context, {required MovieModel movie}) {
    _getGenresList(context: context);
    _getMovieList(context: context);
    emit(state.copyWith(movie: movie));
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
    result.fold(
      (dynamic l) => customSnackBar(context, content: l.code),
      (r) async {

      emit(state.copyWith(movieList: r));
      }
    );
  }

  String handledFindGenreName(int id) => state.genres
      .firstWhere(
        (element) => element.id == id,
        orElse: () => GenresModel.init(),
      )
      .name;

  void onTapButton(MovieModel movie) =>
      AppNavigator.push(Routes.DETAIL_MOVIE, arguments: movie);
}
