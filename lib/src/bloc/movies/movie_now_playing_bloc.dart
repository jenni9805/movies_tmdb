import 'package:rxdart/subjects.dart';

import 'package:movies_v2/src/data_source/movies/movies_now_playing_data_source.dart';

import 'package:movies_v2/src/model/movies/movies_objetc.dart';

class MovieNowPlayingBloc {
  final _service = MoviesNowPlayingDataSource();

  final _nowPlayingSubject = BehaviorSubject<List<MoviesObject>>();

  Function(List<MoviesObject>) get _nowPlayingSink =>
      _nowPlayingSubject.sink.add;

  Stream<List<MoviesObject>> get nowPlayingStream => _nowPlayingSubject.stream;

  void getNowPlaying() async {
    final response = await _service.getMovieNowPlaying();
    if (isNoClosed()) _nowPlayingSink(response);
  }

  void dispose() {
    _nowPlayingSubject.close();
  }

  bool isNoClosed() => !_nowPlayingSubject.isClosed;
}
