import 'package:flutter/material.dart';
import 'package:movies_v2/src/bloc/movies/movie_now_playing_bloc.dart';
import 'package:movies_v2/src/model/movies/movies_objetc.dart';
import 'package:movies_v2/src/ui/routes.dart';
import 'package:provider/provider.dart';
import 'package:card_swiper/card_swiper.dart';

class MovieNowPlayingPage extends StatelessWidget {
  const MovieNowPlayingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieNowPlayingBloc nowPlayingBloc = Provider.of<MovieNowPlayingBloc>(
      context,
      listen: false,
    );

    final size = MediaQuery.of(context).size;
    return StreamBuilder<List<MoviesObject>>(
      stream: nowPlayingBloc.nowPlayingStream,
      builder: (_, snapshot) {
        final isLoading = (snapshot.data == null);
        if (isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final list = snapshot.data ?? [];
          return SizedBox(
            width: double.infinity,
            height: size.height * 0.3,
            child: Swiper(
              itemCount: list.length,
              layout: SwiperLayout.STACK,
              autoplay: true,
              itemWidth: size.width,
              itemHeight: size.height,
              itemBuilder: (_, index) {
                final movie = list[index];
                return Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            movie.getBackdropUrl(),
                          ),
                          fit: BoxFit.fill,
                          alignment: Alignment.center,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      height: 20,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        movie.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              },
              onTap: (index) {
                final movie = list[index];
                return Navigator.pushNamed(
                  _,
                  Routes.detailsMovies,
                  arguments: movie,
                );
              },
            ),
          );
        }
      },
    );
  }
}
