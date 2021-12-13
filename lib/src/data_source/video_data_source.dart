import 'package:dio/dio.dart';

import 'package:movies_v2/src/data_source/data_source.dart';

import 'package:movies_v2/src/model/video_object.dart';

class VideoDataSource {
  final _dio = Dio();
  final _dataSource = DataSource();

  Future<List<VideoObject>> getVideoMovies({
    required int movieId,
  }) {
    _dio.options.baseUrl = _dataSource.baseUrl;
    return _dio.get(_dataSource.getJson(url: '/3/movie/$movieId/videos')).then(
          (value) => VideoObject.toList(
            json: value.data['results'],
          ),
        );
  }
}
