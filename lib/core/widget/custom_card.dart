import 'package:flutter/material.dart';
import 'package:image_picker_loading_jm/image_picker_loading_jm.dart';
import 'package:yo_me_animo/core/extension/context_extension.dart';
import 'package:yo_me_animo/core/util/app_color.dart';
import 'package:yo_me_animo/core/util/app_text_style.dart';
import 'package:yo_me_animo/core/widget/custom_button.dart';

class CustomCardModel {
  final String rank;
  final String name;
  final String image;
  final String overview;
  final bool isFavorite;

  CustomCardModel({
    required this.rank,
    required this.name,
    required this.image,
    required this.overview,
    required this.isFavorite,
  });
}

class CustomCard extends StatelessWidget {
  final Function() onTap;
  final Function() onTapButton;
  final CustomCardModel customCardModel;

  const CustomCard({
    super.key,
    required this.onTap,
    required this.onTapButton,
    required this.customCardModel,
  });

  @override
  Widget build(BuildContext context) {
    return Material(

      color: AppColors.second,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        splashColor: AppColors.second.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImagePickerLoadingJM(
                imagePickerLoadingJModel: ImagePickerLoadingJModel(
                  image: customCardModel.image,
                  buildBody: (context, provider) => Container(
                    height: context.sizeHeight(0.18),
                    width: context.sizeWidth(0.33),
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
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      customCardModel.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle().buttonStyle,
                    ),
                    Text(
                      customCardModel.overview,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle().description
                    ),
                    const SizedBox(height: 10),
                    CustomButton(label: "ver", onTap: onTapButton)
                  ],
                ),
              ),
              Icon(
                _generateIconStar(),
                color: _generateColorStar(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _generateIconStar() {
    if (customCardModel.isFavorite) return Icons.star;
    return Icons.star_border;
  }

  Color _generateColorStar() {
    if (customCardModel.isFavorite) return AppColors.yellow;
    return AppColors.disable;
  }
}
