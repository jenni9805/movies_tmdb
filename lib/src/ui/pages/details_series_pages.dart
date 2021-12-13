import 'package:flutter/material.dart';
import 'package:movies_v2/src/bloc/series/serie_details_bloc.dart';
import 'package:movies_v2/src/model/series/series_details_object.dart';
import 'package:movies_v2/src/model/series/series_object.dart';
import 'package:movies_v2/src/ui/widgets/app_bar_details.dart';
import 'package:movies_v2/src/ui/widgets/card_episode.dart';
import 'package:movies_v2/src/ui/widgets/overview_details.dart';
import 'package:movies_v2/src/ui/widgets/poster_and_tile_details.dart';
import 'package:provider/provider.dart';

class DetailsSeriesPages extends StatelessWidget {
  const DetailsSeriesPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SeriesObject series =
        ModalRoute.of(context)!.settings.arguments as SeriesObject;

    return MultiProvider(
      providers: [
        Provider<SeriesDetailsBloc>(
          create: (_) {
            final bloc = SeriesDetailsBloc();
            bloc.getDetails(serieId: series.id);
            return bloc;
          },
        ),
      ],
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppBarDetails(
                image: series.getBackdropUrl(),
                title: series.name,
              ),
              _PosterAndTile(),
              OverviewDetails(
                overview: series.overview,
              ),
              CardEpisode(
                image: series.getPosterUrl(),
              ),
              //Aqui va a ir el cast
            ],
          ),
        ),
      ),
    );
  }
}

class _PosterAndTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SeriesDetailsBloc detailsBloc = Provider.of<SeriesDetailsBloc>(
      context,
      listen: false,
    );

    return StreamBuilder<SeriesDetailsObject>(
      stream: detailsBloc.detailsStream,
      builder: (_, snapshot) {
        final data = snapshot.data;

        if (data == null) {
          return const CircularProgressIndicator();
        } else {
          return PosterAndTileDetails(
            id: data.id,
            image: data.getPosterUrl(),
            title: data.name,
            stars: data.voteAverage,
            duration: 'Duración: ${data.episodeRunTime[0]} min.',
          );
        }
      },
    );
  }
}
