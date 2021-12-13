import 'package:movies_v2/src/data_source/video_data_source.dart';
import 'package:movies_v2/src/model/video_object.dart';
import 'package:rxdart/rxdart.dart';

class VideoMoviesBloc {
  final _service = VideoDataSource();

  final _videosSubject = BehaviorSubject<List<VideoObject>>();

  Function(List<VideoObject>) get _videosSink => _videosSubject.sink.add;

  Stream<List<VideoObject>> get videoStream => _videosSubject.stream;

  void getVideos({required int movieId}) async {
    final videoList = await _service.getVideoMovies(movieId: movieId);
    if (isNoClosed()) _videosSink(videoList);
  }

  void dispose() {
    _videosSubject.close();
  }

  bool isNoClosed() => !_videosSubject.isClosed;
}
