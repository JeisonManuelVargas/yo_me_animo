import 'package:flutter/material.dart';
import 'package:yo_me_animo/core/model/user_model.dart';
import 'package:yo_me_animo/core/util/app_color.dart';
import 'package:yo_me_animo/core/model/movie_model.dart';
import 'package:yo_me_animo/core/extension/extension.dart';
import 'package:yo_me_animo/core/util/app_text_style.dart';
import 'package:yo_me_animo/core/navigation/navigator.dart';
import 'package:yo_me_animo/core/extension/context_extension.dart';
import 'package:image_picker_loading_jm/image_picker_loading_jm.dart';

class ScrollCuriousAppBar extends StatelessWidget {
  final UserModel user;
  final MovieModel movie;
  final List<Widget> children;
  final ScrollController controller;
  final Function(BuildContext, int) saveMovie;

  const ScrollCuriousAppBar({
    super.key,
    required this.user,
    required this.movie,
    required this.children,
    required this.saveMovie,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverAppBar(
          pinned: false,
          primary: true,
          titleSpacing: 0,
          forceElevated: true,
          leading: const SizedBox(),
          actions: [
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: context.sizeWidth(0.02)),
              width: context.sizeWidth(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => AppNavigator.pop(),
                    icon: const Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                  IconButton(
                    onPressed: () => saveMovie(context, movie.id),
                    icon: user.favoriteMovies.contains(movie.id)
                        ? const Icon(Icons.star, color: AppColors.yellow)
                        : const Icon(Icons.star_border),
                  )
                ],
              ),
            )
          ],
          excludeHeaderSemantics: true,
          automaticallyImplyLeading: true,
          backgroundColor: AppColors.second,
          expandedHeight: context.sizeHeight(0.5),
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: ImagePickerLoadingJM(
                    imagePickerLoadingJModel: ImagePickerLoadingJModel(
                      image: movie.posterPath.stringToImageUrl,
                      imageError: "assets/images/user.jpeg",
                      buildBody: (_, provider) => Image(
                        image: provider,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: context.sizeHeight(0.5),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primary.withOpacity(0.9),
                          AppColors.primary.withOpacity(0.1),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: context.sizeHeight(0.2),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.sizeWidth(0.1)),
                    width: context.sizeWidth(),
                    child: Text(
                      movie.title,
                      textAlign: TextAlign.center,
                      style: AppTextStyle().h1Title,
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                ),
              ),
              width: context.sizeWidth(),
              height: 30,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Material(
            color: AppColors.primary,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: children,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
