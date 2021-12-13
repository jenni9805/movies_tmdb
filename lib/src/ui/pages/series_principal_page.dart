import 'package:flutter/material.dart';
import 'package:movies_v2/src/bloc/series/serie_popular_bloc.dart';
import 'package:movies_v2/src/bloc/series/serie_top_rated_bloc.dart';
import 'package:movies_v2/src/ui/pages/series_popular_page.dart';
import 'package:provider/provider.dart';

class SeriesPrincipalPage extends StatelessWidget {
  const SeriesPrincipalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SeriesPopularBloc>(
          create: (_) {
            final bloc = SeriesPopularBloc();
            bloc.getPopular();
            return bloc;
          },
        ),
        Provider<SeriesTopRatedBloc>(
          create: (_) {
            final bloc = SeriesTopRatedBloc();
            bloc.getTopRated();
            return bloc;
          },
        ),
      ],
      child: _buildBody(),
    );
  }

  Widget _buildBody(){
    return PageView(
      scrollDirection: Axis.vertical,
      children: const [
        SeriesPopularPage(),

      ],
    );
  }
}
