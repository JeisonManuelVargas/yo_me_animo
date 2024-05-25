import 'package:flutter/material.dart';
import 'package:yo_me_animo/core/base/base_page.dart';
import 'package:yo_me_animo/injection_container.dart';
import 'package:yo_me_animo/core/util/app_color.dart';
import 'package:yo_me_animo/core/model/movie_model.dart';
import 'package:yo_me_animo/core/util/app_text_style.dart';
import 'package:yo_me_animo/core/extension/context_extension.dart';
import 'package:yo_me_animo/core/widget/custom_animate_container.dart';
import 'package:yo_me_animo/features/detail_movie/presentation/widget/carousel_widget.dart';
import 'package:yo_me_animo/features/detail_movie/presentation/cubit/detail_movie_cubit.dart';
import 'package:yo_me_animo/features/detail_movie/presentation/widget/card_movie_widget.dart';
import 'package:yo_me_animo/features/detail_movie/presentation/widget/constainer_widget.dart';
import 'package:yo_me_animo/features/detail_movie/presentation/widget/relevant_data_widget.dart';
import 'package:yo_me_animo/features/detail_movie/presentation/widget/scroll_curious_app_bar.dart';

class DetailMovie extends BasePage<DetailMovieState, DetailMovieCubit> {
  final MovieModel movie;

  const DetailMovie({super.key, required this.movie});

  @override
  DetailMovieCubit createBloc(BuildContext context) => sl<DetailMovieCubit>()
    ..init(
      context,
      movie: movie,
    );

  @override
  Widget buildPage(BuildContext context, state, bloc) {
    return Scaffold(
      body: ScrollCuriousAppBar(
        movie: state.movie,
        controller: state.controller,
        children: [
          SizedBox(height: context.sizeHeight(0.01)),
          ContainerWidget(
            late: state.movie.overview,
            textAlign: TextAlign.center,
            style: AppTextStyle().buttonStyle,
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RelevantDataWidget(
                fromAnimation: FromAnimation.fromLeft,
                value: state.movie.voteAverage.toString(),
                label: "Voto Promedio",
              ),
              RelevantDataWidget(
                value: state.movie.popularity.toString(),
                label: "Popularidad",
              ),
            ],
          ),
          const SizedBox(height: 30),
          ContainerWidget(
            late: "Género",
            textAlign: TextAlign.center,
            style: AppTextStyle().h1Title,
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 15,
              runSpacing: 10,
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: List.generate(
                state.movie.genreIds.length,
                (index) => Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.second,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Text(
                      bloc.handledFindGenreName(state.movie.genreIds[index]),
                      style: AppTextStyle().menuStyle,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: context.sizeHeight(0.1)),
          ContainerWidget(late: "Recomendadas", style: AppTextStyle().title),
          SizedBox(height: context.sizeHeight(0.02)),
          CarouselWidget<MovieModel>(
            list: state.movieList,
            itemBuilder: (MovieModel e) => CardMovieWidget(
              movie: e,
              onTapCard: bloc.onTapButton,
            ),
          ),
          SizedBox(height: context.sizeHeight(0.05)),
          CarouselWidget<MovieModel>(
            list: state.secondMovieList,
            itemBuilder: (MovieModel e) => CardMovieWidget(
              movie: e,
              onTapCard: bloc.onTapButton,
            ),
          ),
          SizedBox(height: context.sizeHeight(0.05)),
        ],
      ),
    );
  }
}
