import 'package:favourites/provider/movie_provider.dart';
import 'package:favourites/screens/favorite_movie_screen.dart';
import 'package:favourites/screens/movies_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MovieProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MoviesListScreen(),
        onGenerateRoute: (RouteSettings settings) {
          debugPrint('build route for ${settings.name}');
          var routes = <String, WidgetBuilder>{
            FavoriteMovieScreen.routeName: (BuildContext context) =>
                const FavoriteMovieScreen(),
          };
          WidgetBuilder builder = routes[settings.name]!;
          return MaterialPageRoute(
            builder: (ctx) => builder(ctx),
          );
        },
      ),
    );
  }
}
