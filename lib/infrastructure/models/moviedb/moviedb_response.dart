import 'package:cinemapedia_220031/domain/entities/movie.dart';

// obtener la lista de peliculas actualmente en cartelera
abstract class MoviesRepository {

  Future<List<Movie>> getNowPlaying({int page = 1});
}