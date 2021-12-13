import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

//Notifiers
import 'package:movies_v2/src/notifiers/navigation_notifier.dart';

//Widgets
import 'package:movies_v2/src/ui/pages/movie_principal_page.dart';
import 'package:movies_v2/src/ui/pages/series_principal_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationNotifier>(
          create: (_) => NavigationNotifier(),
        ),
      ],
      child: _buildNavigation(),
    );
  }

  Widget _buildNavigation() {
    List<Widget> _widgetOptions = <Widget>[
      const MoviePrincipalPage(),
      const SeriesPrincipalPage(),
    ];
    return Consumer<NavigationNotifier>(
      builder: (_, notifier, __) {
        int _selectIndex = notifier.currentPosition;
        return Scaffold(
          appBar: AppBar(
            title: notifier.currentPosition == 0
                ? const Text('Peliculas')
                : const Text('Series'),
            backgroundColor: Colors.blue,
          ),
          body: Center(
            child: _widgetOptions.elementAt(_selectIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: 'Peliculas',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.tv),
                label: 'Series',
              ),
            ],
            currentIndex: _selectIndex,
            selectedItemColor: Colors.blue,
            onTap: (index) {
              notifier.change(index);
            },
          ),
        );
      },
    );
  }
}
