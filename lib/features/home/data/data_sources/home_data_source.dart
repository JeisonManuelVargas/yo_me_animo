import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yo_me_animo/core/errors/exceptions.dart';
import 'package:yo_me_animo/core/extension/extension.dart';
import 'package:yo_me_animo/core/model/movie_model.dart';
import 'package:yo_me_animo/core/services/abstract_api.dart';

abstract class HomeDataSource {
  Future<List<MovieModel>> getListMovies();
}

class HomeDataSourceImpl implements HomeDataSource {
  final FirebaseFirestore db;
  final String userCollection = 'users';

  HomeDataSourceImpl({required this.db});

  @override
  Future<List<MovieModel>> getListMovies() async {
    try {
       final res = await AbstractApi().readData(urlSpecific: "movie/popular".stringToUri);
       List data = res.result['results'];
       final listMovie = data.map((e) => MovieModel.fromJson(e)).toList();
      return listMovie;
    } catch (e) {
      throw HomeException(code: 'Error al cargar datos desde la API');
    }
  }


}
