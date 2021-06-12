import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

import './theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Movies(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: movieTheme,
          home: MyHomePage(),
       ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My to-watch list',
        ),
      ),
      drawer: MainDrawer(),
      body: MyListView(),
    );
  }
}

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Movies movies = Provider.of<Movies>(context, listen: false);
    return ListView.builder(
      itemCount: movies.movieCount,
      itemBuilder: (BuildContext context, int index) {
        return MovieTile(
          movieIndex: index,
        );
      },
    );
  }
}

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                left: 20.0,
                top: 40.0,
              ),
              width: double.infinity,
              height: 100.0,
              color: Colors.red[600],
              child: Text(
                'Movies',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            DrawerListTile(
                name: 'Home',
                icon: Icons.home,
                onTapHandler: () {
                  Navigator.pushNamed(context, '/');
                }),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onTapHandler;

  const DrawerListTile({
    @required this.name,
    @required this.icon,
    @required this.onTapHandler,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapHandler(),
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(15.0, 20.0, 20.0, 0.0),
        leading: Icon(
          icon,
          color: Colors.red[600],
          size: 30.0,
        ),
        title: Text(name),
      ),
    );
  }
}

class Movies extends ChangeNotifier {
  final List<MovieModel> _movies = [
    MovieModel(
      movieId: 'M1',
      movieName: 'The Godfather',
    ),
    MovieModel(
      movieId: 'M3',
      movieName: 'Evangelion',
    ),
    MovieModel(
      movieId: 'M4',
      movieName: 'La Dolche Vita',
    ),
    MovieModel(
      movieId: 'M4',
      movieName: 'The Queen\'s Gambit',
    ),
  ];

  List<MovieModel> get movies {
    return _movies;
  }

  int get movieCount {
    return _movies.length;
  }

  void updateFavorite(MovieModel movieItem) {
    movieItem.toggleFavorite();
    notifyListeners();
  }

  List<MovieModel> get favoriteMovies {
    return movies.where((movie) => movie.isFavorite).toList();
  }

  int get favCount {
    return favoriteMovies.length;
  }
}

class MovieTile extends StatelessWidget {
  final int movieIndex;

  MovieTile({
    @required this.movieIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Movies>(
      builder: (context, movies, child) {
        MovieModel movie = movies.movies[movieIndex];
        return ListTile(
          title: Text(
            movie.movieName,
            style: (movie.isFavorite)
                ? TextStyle(color: Colors.black)
                : TextStyle(color: Colors.black54),
          ),
          trailing: IconButton(
            icon: (movie.isFavorite)
                ? Icon(
              Icons.favorite,
              color: Colors.red,
            )
                : Icon(
              Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              Provider.of<Movies>(context, listen: false).updateFavorite(movie);
            },
          ),
        );
      },
    );
  }
}

class MovieModel {
  String movieId;
  String movieName;
  bool isFavorite;

  MovieModel({
    @required this.movieId,
    @required this.movieName,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}
