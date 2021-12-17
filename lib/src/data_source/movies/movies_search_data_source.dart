import 'package:dio/dio.dart';
import 'package:movies_v2/src/data_source/data_source.dart';
import 'package:movies_v2/src/model/movies/movies_objetc.dart';

class MoviesSearchDataSource {
  final _dio = Dio();
  final _dataSource = DataSource();

  Future<List<MoviesObject>> getSearchMovies({
    required String query,
  }) {
    final baseUrl =
        '${_dataSource.baseUrl}${_dataSource.getJson(url: '/3/search/movie')}&query=$query';
    return _dio.get(baseUrl).then(
          (value) => MoviesObject.toList(
            json: value.data['results'],
          ),
        );
  }
}
