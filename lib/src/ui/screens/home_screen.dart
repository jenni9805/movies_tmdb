import 'package:flutter/material.dart';
import 'package:movies_v2/src/ui/screens/login_screen.dart';

import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';

//resources
import 'package:movies_v2/src/resources/colors.dart';

//Notifiers
import 'package:movies_v2/src/notifiers/login_notifier.dart';
import 'package:movies_v2/src/notifiers/navigation_notifier.dart';

//Widgets
import 'package:movies_v2/src/bloc/movies/movie_search_bloc.dart';
import 'package:movies_v2/src/ui/pages/movie_principal_page.dart';
import 'package:movies_v2/src/ui/pages/series_principal_page.dart';
import 'package:movies_v2/src/ui/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  late User loggedinUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser()  {
    try {
      final user =  _auth.currentUser;

      if (user == null) {
        LoginScreen();
      }else{
        loggedinUser = user;
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationNotifier>(
          create: (_) => NavigationNotifier(),
        ),
      ],
      child: _buildNavigation(context: context),
    );
  }

  Widget _buildNavigation({required BuildContext context}) {
    List<Widget> _widgetOptions = <Widget>[
      const MoviePrincipalPage(),
      const SeriesPrincipalPage(),
    ];

    var stateLogin = Provider.of<LoginNotifier>(
      context,
      listen: false,
    );

    return Consumer<NavigationNotifier>(
      builder: (_, notifier, __) {
        int _selectIndex = notifier.currentPosition;
        return Scaffold(
          appBar: AppBar(
            title: notifier.currentPosition == 0
                ? const Text('Peliculas')
                : const Text('Series'),
            backgroundColor: WlColors.two,
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => showSearch(
                  context: context,
                  delegate: SearchScreen(),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.login),
                onPressed: () {
                  _auth.signOut();
                  stateLogin.logout();
                },
              )
            ],
          ),
          body: Center(
            child: _widgetOptions.elementAt(_selectIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: 'Películas',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.tv),
                label: 'Series',
              ),
            ],
            currentIndex: _selectIndex,
            selectedItemColor: WlColors.two,
            onTap: (index) {
              notifier.change(index);
            },
          ),
        );
      },
    );
  }
}
