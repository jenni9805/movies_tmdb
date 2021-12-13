import 'package:movies_v2/src/data_source/series/series_popular_data_source.dart';
import 'package:movies_v2/src/model/series/series_object.dart';
import 'package:rxdart/rxdart.dart';

class SeriesPopularBloc {
  final _service = SeriesPopularDataSource();

  final _popularSubject = BehaviorSubject<List<SeriesObject>>();

  Function(List<SeriesObject>) get _popularSink => _popularSubject.sink.add;

  Stream<List<SeriesObject>> get popularStream => _popularSubject.stream;

  void getPopular() async {
    final result = await _service.getSeriesPopular();
    if (isNoClosed()) _popularSink(result);
  }

  void dispose() {
    _popularSubject.close();
  }

  bool isNoClosed() => !_popularSubject.isClosed;
}
