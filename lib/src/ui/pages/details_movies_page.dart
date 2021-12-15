import 'package:flutter/material.dart';
import 'package:movies_v2/src/ui/widgets/app_bar_details.dart';
import 'package:movies_v2/src/ui/widgets/overview_details.dart';
import 'package:movies_v2/src/ui/widgets/poster_and_tile_details.dart';

import 'package:provider/provider.dart';

import 'package:movies_v2/src/bloc/movies/movie_detail_bloc.dart';
import 'package:movies_v2/src/bloc/video_bloc.dart';

import 'package:movies_v2/src/model/movies/movies_details_object.dart';
import 'package:movies_v2/src/model/movies/movies_objetc.dart';

import 'package:movies_v2/src/ui/widgets/video_player_page.dart';
import 'package:movies_v2/src/ui/widgets/cast.dart';

class DetailsMoviesPage extends StatelessWidget {
  const DetailsMoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MoviesObject movies =
        ModalRoute.of(context)!.settings.arguments as MoviesObject;

    final size = MediaQuery.of(context).size;

    return MultiProvider(
      providers: [
        Provider<MovieDetailsBloc>(
          create: (_) {
            final bloc = MovieDetailsBloc();
            bloc.getDetails(idMovie: movies.id);
            return bloc;
          },
        ),
        Provider<VideoMoviesBloc>(
          create: (_) {
            final bloc = VideoMoviesBloc();
            bloc.getVideos(movieId: movies.id);
            return bloc;
          },
        ),
      ],
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: size.height * 0.77,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    AppBarDetails(
                      image: movies.getBackdropUrl(),
                      title: movies.title,
                    ),
                    PosterAndTileDetails(
                      id: movies.id,
                      image: movies.getPosterUrl(),
                      title: movies.title,
                      stars: movies.voteAverage,
                      duration: 'Estreno: ${movies.releaseDate}',
                    ),
                    OverviewDetails(
                      overview: movies.overview,
                    ),
                  ],
                ),
              ),
            ),
            //Aqui va a ir el cast
            const Expanded(child: Casting())
          ],
        ),
      ),
    );
  }
}

class Casting extends StatelessWidget {
  const Casting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieDetailsBloc detailsBloc = Provider.of<MovieDetailsBloc>(
      context,
      listen: false,
    );
    return StreamBuilder<List<Cast>>(
      stream: detailsBloc.detailsStream,
      builder: (_, snapshot) {
        final isLoading = (snapshot.data == null);
        if (isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final list = snapshot.data ?? [];
          return ListView.builder(
            itemCount: list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final cast = list[index];
              return CastCard(
                image: cast.getPosterUrl(),
                name: cast.name,
              );
            },
          );
        }
      },
    );
  }
}
