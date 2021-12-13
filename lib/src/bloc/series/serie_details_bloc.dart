import 'package:rxdart/subjects.dart';
import 'package:movies_v2/src/data_source/series/series_details_data_source.dart';
import 'package:movies_v2/src/model/series/series_details_object.dart';

class SeriesDetailsBloc {
  final _service = SeriesDetailsDataSource();

  final _detailsSubject = BehaviorSubject<SeriesDetailsObject>();

  Function(SeriesDetailsObject) get _detailsSink => _detailsSubject.sink.add;

  Stream<SeriesDetailsObject> get detailsStream => _detailsSubject.stream;

  void getDetails({
    required int serieId,
  }) async {
    final detail = await _service.getSeriesDetail(seriesId: serieId);
    if (isNoClosed()) _detailsSink(detail);
  }

  void dispose() {
    _detailsSubject.close();
  }

  bool isNoClosed() => !_detailsSubject.isClosed;
}
