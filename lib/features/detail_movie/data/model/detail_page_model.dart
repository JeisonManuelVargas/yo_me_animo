import 'package:yo_me_animo/core/model/movie_model.dart';
import 'package:yo_me_animo/core/model/user_model.dart';

class DetailPageModel {
  final MovieModel movie;
  final UserModel userModel;

  DetailPageModel({required this.userModel, required this.movie});
}