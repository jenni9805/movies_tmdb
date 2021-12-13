import 'package:rxdart/subjects.dart';

import 'package:movies_v2/src/data_source/movies/movies_popular_data_source.dart';

import 'package:movies_v2/src/model/movies/movies_objetc.dart';

class MoviePopularBloc {
  final _service = MoviesPopularDtaSource();

  final _popularSubject = BehaviorSubject<List<MoviesObject>>();

  Function(List<MoviesObject>) get _popularSink => _popularSubject.sink.add;

  Stream<List<MoviesObject>> get popularStream => _popularSubject.stream;

  void getPopular() async {
    final response = await _service.getMoviePopular();
    if (isNoClosed()) _popularSink(response);
  }

  void dispose() {
    _popularSubject.close();
  }

  bool isNoClosed() => !_popularSubject.isClosed;
}
