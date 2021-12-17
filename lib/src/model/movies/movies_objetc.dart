import 'package:movies_v2/src/resources/utils.dart';

class MoviesObject {
  static const String dbId = 'id';
  static const String dbVoteAverage = 'vote_average';
  static const String dbTitle = 'original_title';
  static const String dbPosterPath = 'poster_path';
  static const String dbBackdropPath = 'backdrop_path';
  static const String dbOverview = 'overview';
  static const String dbReleaseDate = 'release_date';
  static const String dbGenreIds = 'genre_ids';

  final int id;
  final double voteAverage;
  late final String title;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final List<dynamic> genreIds;

  MoviesObject({
    required this.id,
    required this.voteAverage,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.genreIds,
  });

  String getPosterUrl() => getMediumPicturePoster(posterPath);

  String getBackdropUrl() => getMediumPictureBackdrop(backdropPath);

  static List<MoviesObject> toList({
    required List<dynamic> json,
  }) =>
      json.map((e) => MoviesObject.fromJson(json: e)).toList();

  factory MoviesObject.fromJson({
    required Map<String, dynamic> json,
  }) =>
      MoviesObject(
        id: json[dbId].toInt() ?? 0,
        voteAverage: json[dbVoteAverage].toDouble() ?? 0.0,
        title: json[dbTitle] ?? '',
        posterPath: json[dbPosterPath] ?? '',
        backdropPath: json[dbBackdropPath] ?? '',
        overview: json[dbOverview] ?? '',
        releaseDate: json[dbReleaseDate] ?? '',
        genreIds: json[dbGenreIds] ?? '',
      );

  Map<String, dynamic> toJson() => {
    dbId: id,
    dbVoteAverage: voteAverage,
    dbTitle: title,
    dbPosterPath: posterPath,
    dbBackdropPath: backdropPath,
    dbOverview: overview,
    dbReleaseDate: releaseDate,
    dbGenreIds: genreIds
  };
}
