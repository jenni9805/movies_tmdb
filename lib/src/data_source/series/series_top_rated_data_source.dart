import 'package:dio/dio.dart';
import 'package:movies_v2/src/data_source/data_source.dart';
import 'package:movies_v2/src/model/series/series_object.dart';

class SeriesTopRatedDataSource {
  final _dio = Dio();
  final _dataSource = DataSource();

  Future<List<SeriesObject>> getSeriesTopRated() {
    _dio.options.baseUrl = _dataSource.baseUrl;
    return _dio.get(_dataSource.getJson(url: '3/tv/top_rated')).then(
          (value) => SeriesObject.toList(
            json: value.data['results'],
          ),
        );
  }
}
