import 'package:cinemapedia_220031/presentation/providers/movies/movie_slideshow_provider.dart';
import 'package:cinemapedia_220031/presentation/providers/movies/movies_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_220031/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  /// Identificador único para navegación con GoRouter
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _HomeView(),
    bottomNavigationBar: CustomBottomNavigationbar(),);
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}


class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    /// Carga la primera página de películas al inicializar la pantalla
    /// Usa .read() porque es una acción única, no una escucha continua
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlaying = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideShowProvider);

    /// Lista deslizable que muestra todas las películas
    return Column(
      children: [
        CustomAppbar(),
        MovieSlideshow(movies: slideShowMovies),
        MovieHorizontalListview(movies: nowPlaying,
        title: 'En cines',
        subTitle: 'Miescoles, 22 de Octubre',)
        
      ],
    );
  }
}