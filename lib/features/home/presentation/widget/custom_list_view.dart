import 'package:flutter/cupertino.dart';
import 'package:yo_me_animo/core/extension/extension.dart';
import 'package:yo_me_animo/core/model/movie_model.dart';
import 'package:yo_me_animo/core/widget/custom_card.dart';
import 'package:yo_me_animo/core/widget/custom_title.dart';

typedef IsFavorite = bool Function(MovieModel);

class CustomListView extends StatelessWidget {
  final GlobalKey? listKey;
  final IsFavorite isFavorite;
  final List<MovieModel> listMovie;
  final ScrollController? controller;
  final Function(MovieModel) onTapButton;
  final Function(BuildContext, MovieModel) onTapCard;

  const CustomListView({
    super.key,
    this.listKey,
    this.controller,
    required this.listMovie,
    required this.onTapCard,
    required this.isFavorite,
    required this.onTapButton,
  });

  @override
  Widget build(BuildContext context) {
    return listMovie.isNotEmpty
        ? ListView.builder(
            key: listKey,
            controller: controller,
            itemCount: listMovie.length,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CustomCard(
                onTap: () => onTapCard(context, listMovie[index]),
                onTapButton: () => onTapButton(listMovie[index]),
                customCardModel: CustomCardModel(
                  name: listMovie[index].title,
                  overview: listMovie[index].overview,
                  rank: listMovie[index].voteAverage.toString(),
                  image: listMovie[index].backdropPath.stringToImageUrl,
                  isFavorite: isFavorite(listMovie[index]),
                ),
              ),
            ),
          )
        : Container(
            margin: const EdgeInsets.symmetric(vertical: 150),
            child: const Center(
              child: TitleCustom(
                firstTitle: "Empty list",
                secondTitle: "At this time we do not have any data",
              ),
            ),
          );
  }
}
