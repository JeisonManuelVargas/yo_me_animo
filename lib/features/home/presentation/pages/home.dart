import 'package:flutter/material.dart';
import 'package:yo_me_animo/core/model/user_model.dart';
import 'package:yo_me_animo/injection_container.dart';
import 'package:yo_me_animo/core/base/base_page.dart';
import 'package:yo_me_animo/features/home/presentation/cubit/home_cubit.dart';
import 'package:yo_me_animo/features/home/presentation/widget/loading_page.dart';
import 'package:yo_me_animo/features/home/presentation/widget/header_custom.dart';
import 'package:yo_me_animo/features/home/presentation/widget/custom_list_view.dart';

class Home extends BasePage<HomeState, HomeCubit> {
  final UserModel user;

  const Home({super.key, required this.user});

  @override
  HomeCubit createBloc(BuildContext context) => sl<HomeCubit>()
    ..init(
      context,
      user,
    );

  @override
  Widget buildPage(BuildContext context, state, bloc) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: HeaderCustom(
                  title: "Bienvenido 🚀",
                  onTap: bloc.changeListView,
                  subTitle: state.user.name,
                  selected: state.itemMenuSelected,
                ),
              ),
              Flexible(
                flex: 5,
                fit: FlexFit.loose,
                child: LoadingPage(
                  isLoading: state.isLoading,
                  child: PageView(
                    controller: state.pageController,
                    children: [
                      CustomListView(
                        key: state.listCoinKey,
                        onTapCard: bloc.onTapCard,
                        listMovie: state.movieList,
                        onTapButton: bloc.onTapButton,
                        controller: state.scrollController,
                        isFavorite: bloc.validateIsFavorite,
                      ),
                      CustomListView(
                        onTapCard: bloc.onTapCard,
                        onTapButton: bloc.onTapButton,
                        listMovie: state.movieListFavorite,
                        isFavorite: bloc.validateIsFavorite,
                        controller: state.scrollControllerFavorite,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
