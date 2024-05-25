import 'dart:convert';

MovieModel movieModelFromJson(String str) =>
    MovieModel.fromJson(json.decode(str));

String movieModelToJson(MovieModel data) => json.encode(data.toJson());

class MovieModel {
  int id;
  bool adult;
  bool video;
  String title;
  int voteCount;
  String overview;
  double popularity;
  String posterPath;
  double voteAverage;
  List<int> genreIds;
  String backdropPath;
  String originalTitle;
  DateTime releaseDate;
  String originalLanguage;

  MovieModel({
    required this.id,
    required this.adult,
    required this.title,
    required this.video,
    required this.genreIds,
    required this.overview,
    required this.voteCount,
    required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.backdropPath,
    required this.originalTitle,
    required this.originalLanguage,
  });

  MovieModel copyWith({
    int? id,
    bool? video,
    bool? adult,
    String? title,
    int? voteCount,
    String? overview,
    double? popularity,
    String? posterPath,
    double? voteAverage,
    List<int>? genreIds,
    String? backdropPath,
    DateTime? releaseDate,
    String? originalTitle,
    String? originalLanguage,
  }) =>
      MovieModel(
        id: id ?? this.id,
        adult: adult ?? this.adult,
        title: title ?? this.title,
        video: video ?? this.video,
        genreIds: genreIds ?? this.genreIds,
        overview: overview ?? this.overview,
        voteCount: voteCount ?? this.voteCount,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        releaseDate: releaseDate ?? this.releaseDate,
        voteAverage: voteAverage ?? this.voteAverage,
        backdropPath: backdropPath ?? this.backdropPath,
        originalTitle: originalTitle ?? this.originalTitle,
        originalLanguage: originalLanguage ?? this.originalLanguage,
      );

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        title: json["title"],
        video: json["video"],
        adult: json["adult"],
        overview: json["overview"],
        voteCount: json["vote_count"],
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
        originalTitle: json["original_title"],
        popularity: json["popularity"]?.toDouble(),
        originalLanguage: json["original_language"],
        voteAverage: json["vote_average"]?.toDouble(),
        releaseDate: DateTime.parse(json["release_date"]),
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
      );

  factory MovieModel.init() => MovieModel(
        id: 0,
        title: "",
        video: true,
        adult: false,
        overview: "",
        voteCount: 0,
        popularity: 0,
        posterPath: "",
        voteAverage: 0,
        genreIds: [],
        backdropPath: "",
        originalTitle: "",
        originalLanguage: "",
        releaseDate: DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "adult": adult,
        "video": video,
        "overview": overview,
        "vote_count": voteCount,
        "popularity": popularity,
        "poster_path": posterPath,
        "vote_average": voteAverage,
        "backdrop_path": backdropPath,
        "original_title": originalTitle,
        "original_language": originalLanguage,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
      };
}
