import 'package:flutter/material.dart';
import 'package:yo_me_animo/core/util/app_color.dart';
import 'package:yo_me_animo/core/util/app_text_style.dart';
import 'package:yo_me_animo/core/widget/custom_title.dart';
import 'package:yo_me_animo/core/extension/context_extension.dart';
import 'package:yo_me_animo/features/home/data/model/menu_type.dart';

class HeaderCustom extends StatelessWidget {
  final String title;
  final String subTitle;
  final MenuType selected;
  final Function(MenuType) onTap;

  const HeaderCustom({
    super.key,
    required this.onTap,
    required this.title,
    required this.subTitle,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      color: AppColors.second,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: context.sizeWidth(0.1)),
        children: [
          SizedBox(height: context.sizeHeight(0.06)),
          Container(
            alignment: Alignment.centerLeft,
            child: TitleCustom(
              firstTitle: title,
              secondTitle: subTitle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _generateTextButton(
                  "Películas", Icons.house_outlined, MenuType.ALL_MOVIE),
              _generateTextButton(
                  "Mis favoritos", Icons.star_border, MenuType.FAVORITE)
            ],
          )
        ],
      ),
    );
  }

  _generateTextButton(String label, IconData icon, MenuType type) {
    return Expanded(
      child: InkWell(
        onTap: () => onTap(type),
        splashColor: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.center,
          child: Column(
            children: [
              Icon(
                icon,
                color: selected == type
                    ? AppColors.yellow
                    : AppColors.textButton,
              ),
              Text(
                label,
                style: AppTextStyle().menuStyle.copyWith(
                  color: selected == type
                      ? AppColors.yellow
                      : AppColors.textButton,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
