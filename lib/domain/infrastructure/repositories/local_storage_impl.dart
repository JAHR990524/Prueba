import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';

class LocalStorageImpl extends LocalStorageRepository {
  @override
  Future<bool> isMovieFavorite(int id) {
    // TODO: implement isMovieFavorite
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0}) {
    // TODO: implement loadMovies
    throw UnimplementedError();
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    // TODO: implement toggleFavorite
    throw UnimplementedError();
  }
}
