import 'package:dio/dio.dart';

import 'package:movies_v2/src/data_source/data_source.dart';

import 'package:movies_v2/src/model/movies/movies_objetc.dart';

class MoviesNowPlayingDataSource {
  final _dio = Dio();
  final _dataSource = DataSource();

  Future<List<MoviesObject>> getMovieNowPlaying() {
    _dio.options.baseUrl = _dataSource.baseUrl;
    return _dio
        .get(_dataSource.getJson(url: '/3/movie/now_playing'))
        .then((value) {
      return MoviesObject.toList(
        json: value.data['results'],
      );
    });
  }
}
