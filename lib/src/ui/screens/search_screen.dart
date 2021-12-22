import 'package:flutter/material.dart';
import 'package:movies_v2/src/bloc/movies/movie_search_bloc.dart';
import 'package:movies_v2/src/model/movies/movies_objetc.dart';
import 'package:movies_v2/src/resources/endpoints.dart';
import 'package:movies_v2/src/ui/routes.dart';
import 'package:provider/provider.dart';

class SearchScreen extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Search movie';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MovieSearchBloc>(
          create: (_) {
            final bloc = MovieSearchBloc();
            bloc.getPopular(query: query);
            return bloc;
          },
        ),
      ],
      child: StreamBuilder<List<MoviesObject>>(
        stream: MovieSearchBloc().searchStream,
        builder: (_, snapshot) {
          if (snapshot.data == null) {
            return _emptyContainer();
          } else {
            final list = snapshot.data ?? [];
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (_, int index) => _MovieItem(
                movie: list[index],
              ),
            );
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _emptyContainer();
  }

  Widget _emptyContainer() {
    return const Center(
      child: Icon(
        Icons.movie_creation_outlined,
        color: Colors.black38,
        size: 130,
      ),
    );
  }
} //fin

class _MovieItem extends StatelessWidget {
  final MoviesObject movie;

  const _MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: movie.id,
        child: FadeInImage(
          placeholder: const NetworkImage(Endpoints.urlImageError),
          image: NetworkImage(movie.getPosterUrl()),
          width: 50,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(movie.title),
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.detailsMovies,
          arguments: movie,
        );
      },
    );
  }
}
