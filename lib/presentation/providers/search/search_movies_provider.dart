import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchedMoviesProvider =
    StateNotifierProvider<SeachedMoviesNotifier, List<Movie>>(
  (ref) {
    final movieRepository = ref.read(movieRepositoryProvider);
    return SeachedMoviesNotifier(
        searchMovies: movieRepository.searchMovies, ref: ref);
  },
);

typedef SearchMoviesCallbak = Future<List<Movie>> Function(String query);

class SeachedMoviesNotifier extends StateNotifier<List<Movie>> {
  final SearchMoviesCallbak searchMovies;
  final Ref ref;
  SeachedMoviesNotifier({
    required this.searchMovies,
    required this.ref,
  }) : super([]);

  Future<List<Movie>> searchMovieByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);
    state = movies;
    return movies;
  }
}
