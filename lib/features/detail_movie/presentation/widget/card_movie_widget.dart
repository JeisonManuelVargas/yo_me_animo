import 'package:flutter/material.dart';
import 'package:yo_me_animo/core/model/movie_model.dart';
import 'package:yo_me_animo/core/extension/extension.dart';
import 'package:image_picker_loading_jm/image_picker_loading_jm.dart';

class CardMovieWidget extends StatelessWidget {
  final MovieModel movie;
  final Function(MovieModel) onTapCard;

  const CardMovieWidget({
    Key? key,
    required this.movie,
    required this.onTapCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onTapCard(movie),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImagePickerLoadingJM(
            imagePickerLoadingJModel: ImagePickerLoadingJModel(
              image: movie.posterPath.stringToImageUrl,
              buildBody: (context, provider) => Container(
                height: 250,
                width: 150,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: provider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              imageError: "assets/image/login.jpg",
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 150,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              movie.title,
              maxLines: 2,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
            ),
          )
        ],
      ),
    );
  }
}
