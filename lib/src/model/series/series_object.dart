

import 'package:movies_v2/src/resources/utils.dart';

class SeriesObject {
  static const dbId = 'id';
  static const dbName = 'name';
  static const dbOriginalName = 'original_name';
  static const dbOverview = 'overview';
  static const dbPosterPath = 'poster_path';
  static const dbBackdropPath = 'backdrop_path';
  static const dbFirstAirDate = 'first_air_date';
  static const dbVoteAverage = 'vote_average';
  static const dbGenreIds = 'genre_ids';

  final int id;
  final String name;
  final String originalName;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String firstAirDate;
  final double voteAverage;
  final List<dynamic> genreIds;

  SeriesObject({
    required this.id,
    required this.name,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.firstAirDate,
    required this.voteAverage,
    required this.genreIds,
  });

  String getPosterUrl() => getMediumPicturePosterSeries(posterPath);

  String getBackdropUrl() => getMediumPictureBackdrop(backdropPath);

  static List<SeriesObject> toList({
    required List<dynamic> json,
  }) =>
      json.map((e) => SeriesObject.fromJson(json: e)).toList();

  factory SeriesObject.fromJson({
    required Map<String, dynamic> json,
  }) =>
      SeriesObject(
        id: json[dbId].toInt() ?? 0,
        name: json[dbName] ?? '',
        originalName: json[dbOriginalName] ?? '',
        overview: json[dbOverview] ?? '',
        posterPath: json[dbPosterPath] ?? '',
        backdropPath: json[dbBackdropPath] ?? '',
        firstAirDate: json[dbFirstAirDate] ?? '',
        voteAverage: json[dbVoteAverage].toDouble() ?? 0.0,
        genreIds: json[dbGenreIds] ?? '',
      );

  Map<String, dynamic> toJson() => {
    dbId: id,
    dbName: name,
    dbOriginalName: originalName,
    dbOverview: overview,
    dbPosterPath: posterPath,
    dbBackdropPath: backdropPath,
    dbFirstAirDate: firstAirDate,
    dbVoteAverage: voteAverage,
    dbGenreIds: genreIds,
  };
}
