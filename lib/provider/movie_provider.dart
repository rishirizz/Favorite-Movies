import 'dart:math';

import 'package:favourites/model/movie_model.dart';
import 'package:flutter/material.dart';

class MovieProvider with ChangeNotifier {
  final List<Movie> _initialData = List.generate(
    50,
    (index) => Movie(
      name: 'Movie $index',
      duration: '${Random().nextInt(100) + 60}',
    ),
  );
  final List<Movie> _favouriteMovie = [];

  List<Movie> get movies {
    return [..._initialData];
  }

  List<Movie> get favouriteMovies {
    return [..._favouriteMovie];
  }

  void addToList(Movie movie) {
    _favouriteMovie.add(movie);
    notifyListeners();
  }

  void removeFromList(Movie movie) {
    _favouriteMovie.remove(movie);
    notifyListeners();
  }
}
