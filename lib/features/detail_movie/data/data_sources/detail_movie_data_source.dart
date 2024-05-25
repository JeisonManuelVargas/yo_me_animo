import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yo_me_animo/core/errors/exceptions.dart';
import 'package:yo_me_animo/core/extension/extension.dart';
import 'package:yo_me_animo/core/model/genres_model.dart';
import 'package:yo_me_animo/core/services/abstract_api.dart';

abstract class DetailMovieDataSource {
  Future<List<GenresModel>> getListGenres();
}

class DetailMovieDataSourceImpl implements DetailMovieDataSource {
  final FirebaseFirestore db;
  final String userCollection = 'users';

  DetailMovieDataSourceImpl({required this.db});

  @override
  Future<List<GenresModel>> getListGenres() async {
    try {
       final res = await AbstractApi().readData(urlSpecific: "genre/movie/list".stringToUri);
       List data = res.result['genres'];
       final listMovie = data.map((e) => GenresModel.fromJson(e)).toList();
      return listMovie;
    } catch (e) {
      throw DetailMovieException(code: 'Error al cargar datos desde la API');
    }
  }
}
