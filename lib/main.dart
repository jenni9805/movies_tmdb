import 'package:flutter/material.dart';
import 'package:movies_v2/src/ui/pages/details_movies_page.dart';
import 'package:movies_v2/src/ui/pages/details_series_pages.dart';
import 'package:movies_v2/src/ui/routes.dart';
import 'package:movies_v2/src/ui/screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.homeScreen,
    routes: {
      Routes.homeScreen: (_) => const HomeScreen(),
      Routes.detailsMovies: (_) => const DetailsMoviesPage(),
      Routes.detailsSeries: (_) => const DetailsSeriesPages(),
    },
  ));
}