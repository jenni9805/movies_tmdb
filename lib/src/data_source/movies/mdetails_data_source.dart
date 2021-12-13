import 'package:dio/dio.dart';

import 'package:movies_v2/src/data_source/data_source.dart';

import 'package:movies_v2/src/model/movies/movies_details_object.dart';

class MoviesDetailsDataSource {
  final _dio = Dio();
  final _dataSource = DataSource();

  Future<List<Cast>> getMovieDetail({
    required int movieId,
  }) {
    _dio.options.baseUrl = _dataSource.baseUrl;
    return _dio.get(_dataSource.getJson(url: '/3/movie/$movieId/credits')).then(
          (value) => Cast.toList(
            json: value.data['cast'],
          ),
        );
  }
}
