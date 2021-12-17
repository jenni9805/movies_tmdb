import 'package:rxdart/rxdart.dart';

import 'package:movies_v2/src/data_source/movies/movies_search_data_source.dart';

import 'package:movies_v2/src/model/movies/movies_objetc.dart';

class MovieSearchBloc {
  final _service = MoviesSearchDataSource();

  final _searchSubject = BehaviorSubject<List<MoviesObject>>();

  Function(List<MoviesObject>) get _searchSink => _searchSubject.sink.add;

  Stream<List<MoviesObject>> get searchStream => _searchSubject.stream;

  void getPopular({required String query}) async {
    final response = await _service.getSearchMovies(query: query);
    if (isNoClosed()) _searchSink(response);
  }

  void dispose() {
    _searchSubject.close();
  }

  bool isNoClosed() => !_searchSubject.isClosed;
}
