import 'package:favourites/provider/movie_provider.dart';
import 'package:favourites/screens/favorite_movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoviesListScreen extends StatefulWidget {
  const MoviesListScreen({super.key});

  @override
  State<MoviesListScreen> createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  @override
  Widget build(BuildContext context) {
    final movies = Provider.of<MovieProvider>(context).movies;
    final favouriteMovies = Provider.of<MovieProvider>(context).favouriteMovies;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Movies List'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, FavoriteMovieScreen.routeName);
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('Favorite Movies : ${favouriteMovies.length}'),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.blue.shade100,
                      child: ListTile(
                        title: Text(
                          movies[index].name!,
                        ),
                        subtitle: Text(
                          '${movies[index].duration!} minutes',
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            if (!favouriteMovies.contains(movies[index])) {
                              Provider.of<MovieProvider>(context, listen: false)
                                  .addToList(movies[index]);
                            } else {
                              Provider.of<MovieProvider>(context, listen: false)
                                  .removeFromList(movies[index]);
                            }
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: (favouriteMovies.contains(movies[index]))
                                ? Colors.red
                                : Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
