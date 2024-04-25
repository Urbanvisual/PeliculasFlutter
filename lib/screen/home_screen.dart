import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    // print(moviesProvider.onDisplayMovies);
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Peliculas en cines',
              style: TextStyle(color: Colors.white),
            ),
          ),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () => showSearch(context: context,delegate: MovieSearchDelegate()),
              icon: const Icon(Icons.search_outlined),
              color: Colors.white,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper(movies: moviesProvider.onDisplayMovies),
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Populares',
                onNexPage: ( ) => moviesProvider.getPopularMovies(),
              ),
            ],
          ),
        ));
  }
}
