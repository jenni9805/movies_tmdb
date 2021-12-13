import 'package:movies_v2/src/resources/utils.dart';

class SeriesDetailsObject {
  static const String dbBackdropPath = 'backdrop_path';
  static const String dbEpisodeRunTime = 'episode_run_time';
  static const String dbFirstAirDate = 'first_air_date';
  static const String dbGenres = 'genres';
  static const String dbId = 'id';
  static const String dbInProduction = 'in_production';
  static const String dbLastAirDate = 'last_air_date';
  static const String dbLastEpisodeToAir = 'last_episode_to_air';
  static const String dbName = 'name';
  static const String dbNextEpisodeToAir = 'next_episode_to_air';
  static const String dbNumbersOfEpisodes = 'number_of_episodes';
  static const String dbNumberOfSeasons = 'number_of_seasons';
  static const String dbOriginalName = 'original_name';
  static const String dbOverview = 'overview';
  static const String dbPosterPath = 'poster_path';
  static const String dbProductionCompanies = 'production_companies';
  static const String dbSeasons = 'seasons';
  static const String dbStatus = 'status';
  static const String dbTagline = 'tagline';
  static const String dbType = 'type';
  static const String dbVoteAverge = 'vote_average';

  final String backdropPath;
  final List<int> episodeRunTime;
  final String firstAirDate;
  final List<dynamic> genres;
  final int id;
  final bool inProduction;
  final String lastAirDate;
  final List<dynamic> lastEpisodeToAir;
  final String name;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final String originalName;
  final String overview;
  final String posterPath;
  final List<dynamic> productionCompanies;
  final List<dynamic> seasons;
  final String status;
  final String tagline;
  final String type;
  final double voteAverage;

  SeriesDetailsObject({
    required this.backdropPath,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.id,
    required this.inProduction,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.productionCompanies,
    required this.seasons,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
  });

  String getPosterUrl() => getMediumPicturePosterSeries(posterPath);

  String getBackdropUrl() => getMediumPictureBackdrop(backdropPath);

  static List<SeriesDetailsObject> toList({
    required List<dynamic> json,
  }) =>
      json.map((e) => SeriesDetailsObject.fromJson(json: e)).toList();

  factory SeriesDetailsObject.fromJson({
    required Map<String, dynamic> json,
  }) =>
      SeriesDetailsObject(
        backdropPath: json[dbBackdropPath] ?? '',
        episodeRunTime: json[dbEpisodeRunTime].cast<int>(),
        firstAirDate: json[dbFirstAirDate] ?? '',
        genres: List<Genres>.from(
            json[dbGenres].map((x) => Genres.fromJson(json: x))),
        id: json[dbId].toInt() ?? 0,
        inProduction: json[dbInProduction] ?? false,
        lastAirDate: json[dbLastAirDate] ?? '',
        lastEpisodeToAir: List<LastEpisodeToAir>.from(
            json[dbGenres].map((x) => LastEpisodeToAir.fromJson(json: x))),
        name: json[dbName] ?? '',
        numberOfEpisodes: json[dbNumbersOfEpisodes] ?? 0,
        numberOfSeasons: json[dbNumberOfSeasons] ?? 0,
        originalName: json[dbOriginalName] ?? '',
        overview: json[dbOverview] ?? '',
        posterPath: json[dbPosterPath] ?? '',
        productionCompanies: List<ProductionCompanies>.from(
            json[dbProductionCompanies]
                .map((x) => ProductionCompanies.fromJson(json: x))),
        seasons: List<Season>.from(
            json[dbSeasons].map((x) => Season.fromJson(json: x))),
        status: json[dbStatus] ?? '',
        tagline: json[dbTagline] ?? '',
        type: json[dbType] ?? '',
        voteAverage: json[dbVoteAverge].toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
    dbBackdropPath: backdropPath,
    dbEpisodeRunTime: episodeRunTime,
    dbFirstAirDate: firstAirDate,
    dbGenres: genres,
    dbId: id,
    dbInProduction: inProduction,
    dbLastAirDate: lastAirDate,
    dbLastEpisodeToAir: lastEpisodeToAir,
    dbName: name,
    dbNumbersOfEpisodes: numberOfEpisodes,
    dbNumberOfSeasons: numberOfSeasons,
    dbOriginalName: originalName,
    dbOverview: overview,
    dbPosterPath: posterPath,
    dbProductionCompanies: productionCompanies,
    dbSeasons: seasons,
    dbStatus: status,
    dbTagline: tagline,
    dbType: type,
    dbVoteAverge: voteAverage,
  };
}

/*json['hjghjghgj']?.cast<int>()*/

class Genres {
  static const dbId = 'id';
  static const dbName = 'name';

  final int id;
  final String name;

  Genres({
    required this.id,
    required this.name,
  });

  static List<Genres> toList({
    required List<dynamic> json,
  }) =>
      json.map((e) => Genres.fromJson(json: e)).toList();

  factory Genres.fromJson({required Map<String, dynamic> json}) => Genres(
    id: json[dbId].toInt() ?? 0,
    name: json[dbName] ?? '',
  );

  Map<String, dynamic> toJson() => {
    dbId: id,
    dbName: name,
  };
}

class LastEpisodeToAir {
  static const String dbAirDate = 'air_date';
  static const String dbEpisodeNumber = 'episode_number';
  static const String dbId = 'id';
  static const String dbName = 'name';
  static const String dbOverview = 'overview';
  static const String dbProductionCode = 'production_code';
  static const String dbSeasonNumber = 'season_number';
  static const String dbStillPath = 'still_path';
  static const String dbVoteAverage = 'vote_average';

  final String airDate;
  final int episodeNumber;
  final int id;
  final String name;
  final String overview;
  final String productionCode;
  final String seasonNumber;
  final String stillPath;
  final double voteAverage;

  LastEpisodeToAir({
    required this.airDate,
    required this.episodeNumber,
    required this.id,
    required this.name,
    required this.overview,
    required this.productionCode,
    required this.seasonNumber,
    required this.stillPath,
    required this.voteAverage,
  });

  static List<LastEpisodeToAir> toList({
    required List<dynamic> json,
  }) =>
      json.map((e) => LastEpisodeToAir.fromJson(json: e)).toList();

  factory LastEpisodeToAir.fromJson({required Map<String, dynamic> json}) =>
      LastEpisodeToAir(
        airDate: json[dbAirDate] ?? '',
        episodeNumber: json[dbEpisodeNumber]?.toInt() ?? 0,
        id: json[dbId].toInt() ?? 0,
        name: json[dbName] ?? '',
        overview: json[dbOverview] ?? '',
        productionCode: json[dbProductionCode] ?? '',
        seasonNumber: json[dbSeasonNumber] ?? '',
        stillPath: json[dbStillPath] ?? '',
        voteAverage: json[dbVoteAverage]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
    dbAirDate: airDate,
    dbEpisodeNumber: episodeNumber,
    dbId: id,
    dbName: name,
    dbOverview: overview,
    dbProductionCode: productionCode,
    dbSeasonNumber: seasonNumber,
    dbStillPath: stillPath,
    dbVoteAverage: voteAverage
  };
}

class ProductionCompanies {
  static const String dbId = 'id';
  static const String dbLogoPath = 'logo_path';
  static const String dbName = 'name';
  static const String dbOriginCountry = 'origin_country';

  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  ProductionCompanies({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  static List<ProductionCompanies> toList({
    required List<dynamic> json,
  }) =>
      json.map((e) => ProductionCompanies.fromJson(json: e)).toList();

  factory ProductionCompanies.fromJson({required Map<String, dynamic> json}) =>
      ProductionCompanies(
        id: json[dbId].toInt() ?? 0,
        logoPath: json[dbLogoPath] ?? '',
        name: json[dbName] ?? '',
        originCountry: json[dbOriginCountry] ?? '',
      );

  Map<String, dynamic> toJson() => {
    dbId: id,
    dbName: name,
    dbLogoPath: logoPath,
    dbOriginCountry: originCountry,
  };
}

class Season {
  static const String dbAirDate = 'air_date';
  static const String dbEpisodeCount = 'episode_count';
  static const String dbId = 'id';
  static const String dbName = 'name';
  static const String dbOverview = 'overview';
  static const String dbPosterPath = 'poster_path';
  static const String dbSeasonNumber = 'season_number';

  final String airDate;
  final int episodeCount;
  final int id;
  final String name;
  final String overview;
  final String posterPath;
  final int seasonNumber;

  Season({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
  });

  static List<Season> toList({
    required List<dynamic> json,
  }) =>
      json.map((e) => Season.fromJson(json: e)).toList();

  factory Season.fromJson({required Map<String, dynamic> json}) => Season(
    airDate: json[dbAirDate] ?? '',
    episodeCount: json[dbEpisodeCount].toInt() ?? 0,
    id: json[dbId].toInt() ?? 0,
    name: json[dbName] ?? '',
    overview: json[dbOverview] ?? '',
    posterPath: json[dbPosterPath] ?? '',
    seasonNumber: json[dbSeasonNumber].toInt() ?? 0,
  );

  Map<String, dynamic> toJson() => {
    dbAirDate: airDate,
    dbEpisodeCount: episodeCount,
    dbId: id,
    dbName: name,
    dbOverview: overview,
    dbPosterPath: posterPath,
    dbSeasonNumber: seasonNumber,
  };
}
