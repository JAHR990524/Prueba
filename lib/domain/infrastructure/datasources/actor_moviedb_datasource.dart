import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/infrastructure/mappers/actors_mapper.dart';
import 'package:dio/dio.dart';

import '../../../config/constants/environment.dart';
import '../models/moviedb/credits_response.dart';

class ActorMoviedbDatasource extends ActorsDatasource {
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final dio = Dio(BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3',
        queryParameters: {
          'api_key': Environment.theMovieDbKey,
          'language': 'es-MX'
        }));
    final response = await dio.get('/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(response.data);
    final List<Actor> actors = creditsResponse.cast
        .map((cast) => ActorsMapper.castToEntity(cast))
        .toList();
    return actors;
  }
}
