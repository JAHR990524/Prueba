import 'package:cinemapedia/domain/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/domain/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Este repositorio es inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(datasource: MoviedbDatasource());
});
