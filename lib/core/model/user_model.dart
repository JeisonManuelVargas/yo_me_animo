import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String email;
  DocumentReference? id;
  List<int> favoriteMovies;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.favoriteMovies,
  });

  factory UserModel.fromJson(json, DocumentReference id) => UserModel(
        id: id,
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        favoriteMovies: List<int>.from(json["favorite_movies"].map((x) => x)),
      );

  factory UserModel.init() => UserModel(
        name: "",
        email: "",
        favoriteMovies: []
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "favorite_movies": favoriteMovies,
      };

  UserModel copyWith({
    String? name,
    String? email,
    DocumentReference? id,
    List<int>? favoriteMovies,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        favoriteMovies: favoriteMovies ?? this.favoriteMovies,
      );
}
