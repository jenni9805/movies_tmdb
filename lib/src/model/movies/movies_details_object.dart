import 'package:movies_v2/src/resources/utils.dart';

class MoviesDetailsObject {
  static const String dbId = 'id';
  static const String dbCast = 'cast';

  final int id;
  final List<Cast> cast;


  MoviesDetailsObject({
    required this.id,
    required this.cast,
  });

  static List<MoviesDetailsObject> toList({
    required List<dynamic> json,
  }) =>
      json.map((e) => MoviesDetailsObject.fromJson(json: e)).toList();

  factory MoviesDetailsObject.fromJson({required Map<String, dynamic> json}) =>
      MoviesDetailsObject(
        id: json[dbId].toInt() ?? 0,
        cast: List<Cast>.from(json[dbCast].map((x) => Cast.fromJson(json: x))),
      );

  Map<String, dynamic> toJson() => {
    dbId: id,
    dbCast: cast,
  };
}

class Cast {
  static const String dbId = 'id';
  static const String dbName = 'name';
  static const String dbPopularity = 'popularity';
  static const String dbProfilePath = 'profile_path';
  static const String dbCharacter = 'character';

  final int id;
  final String name;
  final double popularity;
  final String posterPath;
  final String character;

  Cast({
    required this.id,
    required this.name,
    required this.popularity,
    required this.posterPath,
    required this.character,
  });

  String getPosterUrl() => getMediumPicturePoster(posterPath);

  static List<Cast> toList({
    required List<dynamic> json,
  }) =>
      json.map((e) => Cast.fromJson(json: e)).toList();


  factory Cast.fromJson({required Map<String, dynamic> json}) => Cast(
    id: json[dbId].toInt() ?? 0,
    name: json[dbName] ?? '',
    popularity: json[dbPopularity].toDouble() ?? 0.0,
    posterPath: json[dbProfilePath] ?? '',
    character: json[dbCharacter] ?? '',
  );

  Map<String, dynamic> toJson() => {
    dbId: id,
    dbName: name,
    dbPopularity: popularity,
    dbProfilePath: posterPath,
    dbCharacter: character,
  };
}
