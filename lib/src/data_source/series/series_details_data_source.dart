import 'package:dio/dio.dart';

import 'package:movies_v2/src/data_source/data_source.dart';
import 'package:movies_v2/src/model/series/series_details_object.dart';



class SeriesDetailsDataSource {
  final _dio = Dio();
  final _dataSource = DataSource();

  Future<SeriesDetailsObject> getSeriesDetail({
    required int seriesId,
  }) {
    _dio.options.baseUrl = _dataSource.baseUrl;
    return _dio.get(_dataSource.getJson(url: '/3/tv/$seriesId')).then(
      (value) {
        return SeriesDetailsObject.fromJson(
          json: value.data,
        );
      },
    );
  }
}
