import 'package:flutter/material.dart';
import 'package:movies_v2/src/bloc/movies/movie_popular_bloc.dart';
import 'package:movies_v2/src/model/movies/movies_objetc.dart';
import 'package:movies_v2/src/notifiers/navigation_notifier.dart';
import 'package:movies_v2/src/ui/routes.dart';
import 'package:movies_v2/src/ui/widgets/card_general.dart';
import 'package:provider/provider.dart';


class MoviePopularPage extends StatelessWidget {
  const MoviePopularPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoviePopularBloc popularBloc = Provider.of<MoviePopularBloc>(
      context,
      listen: false,
    );

    return StreamBuilder<List<MoviesObject>>(
      stream: popularBloc.popularStream,
      builder: (_, snapshot) {
        final isLoading = (snapshot.data == null);
        if (isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final list = snapshot.data ?? [];
          return Container(
            height: 300,
            color: Colors.transparent,
            child: ListView.builder(
              itemCount: list.length,
              scrollDirection: Axis.horizontal,

              itemBuilder: (_, index) {
                final movie = list[index];
                return Consumer<NavigationNotifier>(
                  builder: (_, notifier, __) {



                    int position = notifier.currentPosition;
                    position = index;
                    return CardGeneral(
                      image: movie.getPosterUrl(),
                      title: movie.title,
                      stars: movie.voteAverage,
                      position: position,
                      route: () {
                        final movie = list[position];
                        Navigator.pushNamed(
                          _,
                          Routes.detailsMovies,
                          arguments: movie,
                        );
                      },
                    );
                  },
                );
              },
            ),
          );
        }
      },
    );
  }
}
