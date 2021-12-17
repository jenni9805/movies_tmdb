import 'package:flutter/material.dart';
import 'package:movies_v2/src/notifiers/login_notifier.dart';
import 'package:movies_v2/src/notifiers/remember_notifier.dart';
import 'package:movies_v2/src/ui/pages/details_movies_page.dart';
import 'package:movies_v2/src/ui/pages/details_series_pages.dart';
import 'package:movies_v2/src/ui/routes.dart';
import 'package:movies_v2/src/ui/screens/home_screen.dart';
import 'package:movies_v2/src/ui/screens/login_screen.dart';
import 'package:movies_v2/src/ui/screens/sign_up_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginNotifier>(
          create: (_) => LoginNotifier(),
        ),
        ChangeNotifierProvider<RememberNotifier>(
          create: (_) => RememberNotifier(),
        ),
      ],
      child: Consumer<LoginNotifier>(
        builder: (_, notifier, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (_) {
                if (notifier.islLogged()) {
                  return const HomeScreen();
                } else {
                  return const LoginScreen();
                }
              },
              Routes.homeScreen: (_) => const HomeScreen(),
              Routes.singUpScreen: (_)=> const SignUpScreen(),
              Routes.detailsMovies: (_) => const DetailsMoviesPage(),
              Routes.detailsSeries: (_) => const DetailsSeriesPages(),
            },
          );
        },
      ),
    );
  }
}
