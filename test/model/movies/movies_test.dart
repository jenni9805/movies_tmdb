import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_v2/src/model/movies/movies_objetc.dart';

void main() {
  test('movies test', () {
    final file = File('test/test_resources/movies/response_popular.json')
        .readAsStringSync();

    final object = jsonDecode(file);

    final movie = Movies.fromJson(json: object as Map<String, dynamic>);

    final popular = MoviesObject.fromJson(json: movie.toJson());

    //expect(movie.movie, movie.movie);
    expect(popular.id, 634649);
    expect(popular.title, "Spider-Man: No Way Home");
    expect(popular.releaseDate, "2021-12-15");
    expect(popular.voteAverage, 8.6);
    expect(popular.overview,
        "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.");
    expect(popular.backdropPath, "/1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg");
    expect(popular.posterPath, "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg");
    //expect(popular.genreIds, [28, 12, 878]);
  });
}
