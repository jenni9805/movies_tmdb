import 'package:flutter/material.dart';
import 'package:movies_v2/src/bloc/series/serie_popular_bloc.dart';
import 'package:movies_v2/src/model/series/series_object.dart';
import 'package:movies_v2/src/notifiers/navigation_notifier.dart';
import 'package:movies_v2/src/ui/routes.dart';
import 'package:movies_v2/src/ui/widgets/card_general.dart';
import 'package:provider/provider.dart';

class SeriesPopularPage extends StatelessWidget {
  const SeriesPopularPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SeriesPopularBloc popularBloc = Provider.of<SeriesPopularBloc>(
      context,
      listen: false,
    );

    //final size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    //final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    //final double itemWidth = size.width / 2;

    return StreamBuilder<List<SeriesObject>>(
      stream: popularBloc.popularStream,
      builder: (_, snapshot) {
        final isLoading = (snapshot.data == null);
        if (isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final list = snapshot.data ?? [];
          return GridView.builder(
            itemCount: list.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              mainAxisExtent: 300,
            ),
            itemBuilder: (_, index) {
              final serie = list[index];
              return Consumer<NavigationNotifier>(
                builder: (_, notifier, __) {
                  int position = notifier.currentPosition;
                  position = index;
                  return CardGeneral(
                    image: serie.getPosterUrl(),
                    title: serie.name,
                    stars: serie.voteAverage,
                    position: position,
                    route: (){
                      Navigator.pushNamed(
                        _,
                        Routes.detailsSeries,
                        arguments: serie,
                      );
                    }
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}
