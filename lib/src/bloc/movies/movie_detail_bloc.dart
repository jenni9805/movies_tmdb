import 'package:movies_v2/src/data_source/movies/mdetails_data_source.dart';
import 'package:movies_v2/src/model/movies/movies_details_object.dart';
import 'package:rxdart/subjects.dart';

class MovieDetailsBloc {
  final _service = MoviesDetailsDataSource();

  final _detailsSubject = BehaviorSubject<List<Cast>>();

  Function(List<Cast>) get _detailsSink => _detailsSubject.sink.add;

  Stream<List<Cast>> get detailsStream => _detailsSubject.stream;

  void getDetails({required int idMovie}) async {
    final detailList = await _service.getMovieDetail(movieId: idMovie);
    if (isNoClosed()) _detailsSink(detailList);
  }

  void dispose() {
    _detailsSubject.close();
  }

  bool isNoClosed() => !_detailsSubject.isClosed;
}
