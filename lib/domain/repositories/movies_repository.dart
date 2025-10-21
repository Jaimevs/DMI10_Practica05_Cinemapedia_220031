import 'package:cinemapedia_220031/domain/entities/movie.dart';

abstract class MoviesRepository {

  // obtener la lista de peliculas actualmente en cartelera 
  
  Future<List<Movie>> getNowPlaying({int page = 1});

}