import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../provider/movie_provider.dart';

class FavoriteMovieScreen extends StatefulWidget {
  const FavoriteMovieScreen({super.key});
  static const String routeName = '/fav-movie';

  @override
  State<FavoriteMovieScreen> createState() => _FavoriteMovieScreenState();
}

class _FavoriteMovieScreenState extends State<FavoriteMovieScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteMovies = Provider.of<MovieProvider>(context).favouriteMovies;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favorite Movies'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.builder(
            itemCount: favouriteMovies.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.blue.shade100,
                child: ListTile(
                  title: Text(
                    favouriteMovies[index].name!,
                  ),
                  subtitle: Text(
                    '${favouriteMovies[index].duration!} minutes',
                  ),
                  trailing: TextButton(
                    onPressed: () {
                      Provider.of<MovieProvider>(context, listen: false)
                          .removeFromList(favouriteMovies[index]);
                    },
                    child: const Text('Remove'),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
