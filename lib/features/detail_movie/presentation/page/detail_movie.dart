import 'package:flutter/material.dart';
import 'package:yo_me_animo/core/base/base_page.dart';
import 'package:yo_me_animo/injection_container.dart';
import 'package:yo_me_animo/core/util/app_color.dart';
import 'package:yo_me_animo/core/model/movie_model.dart';
import 'package:yo_me_animo/core/extension/extension.dart';
import 'package:image_picker_loading_jm/image_picker_loading_jm.dart';
import 'package:yo_me_animo/core/widget/custom_animate_container.dart';
import 'package:yo_me_animo/features/detail_movie/presentation/widget/carousel_widget.dart';
import 'package:yo_me_animo/features/detail_movie/presentation/cubit/detail_movie_cubit.dart';
import 'package:yo_me_animo/features/detail_movie/presentation/widget/card_movie_widget.dart';
import 'package:yo_me_animo/features/detail_movie/presentation/widget/constainer_widget.dart';
import 'package:yo_me_animo/features/detail_movie/presentation/widget/relevant_data_widget.dart';

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAnimateContainer(
              fromAnimation: FromAnimation.fromUp,
              child: ImagePickerLoadingJM(
                imagePickerLoadingJModel: ImagePickerLoadingJModel(
                  image: state.movie.posterPath.stringToImageUrl,
                  buildBody: (context, provider) => Container(
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(60),
                        bottomLeft: Radius.circular(60),
                      ),
                      image: DecorationImage(
                        image: provider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  imageError: "assets/image/login.jpg",
                ),
              ),
            ),
            const SizedBox(height: 30),
            ContainerWidget(
              late: state.movie.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 30),
            ContainerWidget(
              late: state.movie.overview,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
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
            const ContainerWidget(
              late: "Género",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
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
                          horizontal: 10, vertical: 5),
                      child: Text(bloc
                          .handledFindGenreName(state.movie.genreIds[index])),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            CarouselWidget<MovieModel>(
              list: state.movieList,
              itemBuilder: (MovieModel e) => CardMovieWidget(
                movie: e,
                onTapCard: bloc.onTapButton,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
