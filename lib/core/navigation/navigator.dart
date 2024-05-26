import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:yo_me_animo/core/animations/fade_page_route.dart';
import 'package:yo_me_animo/core/model/movie_model.dart';
import 'package:yo_me_animo/core/model/user_model.dart';
import 'package:yo_me_animo/features/home/presentation/pages/home.dart';
import 'package:yo_me_animo/features/detail_movie/presentation/page/detail_movie.dart';
import 'package:yo_me_animo/features/login/presentation/page/login.dart';
import 'package:yo_me_animo/features/register/presentation/page/register.dart';

enum Routes {
  HOME,
  LOGIN,
  REGISTER,
  DETAIL_MOVIE,
}

class _Page {
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String detailMovie = '/detailMovie';

  static const Map<Routes, String> _pageMap = {
    Routes.HOME: home,
    Routes.LOGIN: login,
    Routes.REGISTER: register,
    Routes.DETAIL_MOVIE: detailMovie,
  };

  static String? page(Routes routes) => _pageMap[routes];
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static NavigatorState get state => navigatorKey.currentState!;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    dynamic argument = settings.arguments;

    late UserModel user;
    late MovieModel movie;

    if(argument is UserModel) user = argument;
    if(argument is MovieModel) movie = argument;



    switch (settings.name) {
      case _Page.home:
        return _pageRoute(page: Home(user: user), settings: settings);
      case _Page.register:
        return _pageRoute(page: const Register(), settings: settings);
      case _Page.login:
        return _pageRoute(page: const Login(), settings: settings);
      case _Page.detailMovie:
        return _pageRoute(page: DetailMovie(movie: movie), settings: settings);
      default:
        return _pageRoute(page: const Login(), settings: settings);
    }
  }

  static Route _pageRoute({
    required Widget page,
    Duration? transitionDuration,
    RouteSettings? settings,
  }) {
    return Platform.isIOS
        ? CupertinoPageRoute<Route>(
            settings: settings,
            builder: (context) => page,
          )
        : FadeRoute(
            page: page,
            routeSettings: settings,
            transitionDuration: transitionDuration,
          ) as Route;
  }

  static Future push<T>(
    Routes route, {
    Object? arguments,
    Function(dynamic)? callBack,
  }) =>
      state.pushNamed(_Page.page(route)!, arguments: arguments).then(
            (value) => callBack != null ? callBack(value) : {},
          );

  static Future pushNamedAndRemoveUntil(Routes route, {Object? arguments}) =>
      state.pushNamedAndRemoveUntil(
        _Page.page(route)!,
        (Route routes) => false,
        arguments: arguments,
      );

  static void pop({Object? params}) => state.pop(params);

  static void popUntil(Routes route) => state.popUntil(
        (routes) => routes.settings.name == _Page.page(route)!,
      );
}
