import 'package:cinemapedia_220031/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_220031/domain/entities/movie.dart';
import 'package:cinemapedia_220031/domain/repositories/movies_repository.dart';
// implementar el contrato de MoviesRepository definido en el dominio, esto actua como un adaptador entre el dominio y la capa de infraestructura


class MovieRepositoryImpl extends MoviesRepository {

  final MoviesDatasource datasource;
  MovieRepositoryImpl(this.datasource);

  
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }


}