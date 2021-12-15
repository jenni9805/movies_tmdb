import 'package:flutter/material.dart';
import 'package:movies_v2/src/bloc/movies/movie_now_playing_bloc.dart';
import 'package:movies_v2/src/bloc/movies/movie_popular_bloc.dart';
import 'package:movies_v2/src/ui/pages/movie_now_playing_page.dart';
import 'package:movies_v2/src/ui/pages/movie_popular_page.dart';
import 'package:movies_v2/src/ui/widgets/text_seccion.dart';
import 'package:provider/provider.dart';


class MoviePrincipalPage extends StatelessWidget {
  const MoviePrincipalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MovieNowPlayingBloc>(
          create: (_) {
            final bloc = MovieNowPlayingBloc();
            bloc.getNowPlaying();
            return bloc;
          },
        ),
        Provider<MoviePopularBloc>(
          create: (_) {
            final bloc = MoviePopularBloc();
            bloc.getPopular();
            return bloc;
          },
        ),
      ],
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: const [
        TextSeccion(
          text: 'En cines...',
          size: 20.0,
          color: Colors.blueGrey,
        ),
        MovieNowPlayingPage(),
        TextSeccion(
          text: 'Populares...',
          size: 20.0,
          color: Colors.blueGrey,
        ),
        Expanded(
          child: MoviePopularPage(),
        ),
      ],
    );
  }
}













