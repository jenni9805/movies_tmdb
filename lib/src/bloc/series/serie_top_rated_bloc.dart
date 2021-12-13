import 'package:movies_v2/src/data_source/series/series_top_rated_data_source.dart';
import 'package:movies_v2/src/model/series/series_object.dart';
import 'package:rxdart/rxdart.dart';

class SeriesTopRatedBloc {
  final _service = SeriesTopRatedDataSource();

  final _topRatedSubject = BehaviorSubject<List<SeriesObject>>();

  Function(List<SeriesObject>) get _topRatedSink => _topRatedSubject.sink.add;

  Stream<List<SeriesObject>> get topRatedStream => _topRatedSubject.stream;

  void getTopRated() async {
    final result = await _service.getSeriesTopRated();

    if (isNoClosed()) {
      _topRatedSink(result);
    }
  }

  void dispose() {
    _topRatedSubject.close();
  }

  bool isNoClosed() => !_topRatedSubject.isClosed;
}
