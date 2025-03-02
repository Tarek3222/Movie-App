import 'package:dio/dio.dart';
import 'package:movies/core/networking/api_constants.dart';
import 'package:movies/features/home/data/models/actor_response.dart';
import 'package:movies/features/home/data/models/movie_details_response.dart';
import 'package:movies/features/home/data/models/movie_images_response.dart';
import 'package:movies/features/home/data/models/movie_response.dart';
import 'package:movies/features/home/data/models/movie_video_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @GET(ApiConstants.listMoviesEndpoint)
  Future<MovieResponseList> getListMovies();

  @GET(ApiConstants.trendingMoviesEndpoint)
  Future<MovieResponseList> getTrendingMovies();

  @GET(ApiConstants.searchMoviesEndpoint)
  Future<MovieResponseList> searchMovies(
    @Query('query') String query,
  );

  @GET(ApiConstants.movieDistinctEndpoint)
  Future<MovieResponseList> getMoviesByGenre(
    @Query('with_genres') int genreId,
  );

  @GET(ApiConstants.popularMoviesEndpoint)
  Future<MovieResponseList> getPopularMovies();

  @GET(ApiConstants.topRatedMoviesEndpoint)
  Future<MovieResponseList> getTopRatedMovies();

  @GET('movie/{movie_id}/similar')
  Future<MovieResponseList> getSimilarMovies(@Path('movie_id') String movieId);

  @GET("${ApiConstants.detailsMoviesEndpoint}/{movie_id}")
  Future<MovieDetailsResponse> getMovieDetails(
      @Path('movie_id') String movieId);

  @GET(ApiConstants.actorsEndpoint)
  Future<ActorListResponse> getActors();

  @GET("movie/{movie_id}/videos")
  Future<MovieVideoResponseList> getMovieVideos(
      @Path('movie_id') String movieId);

  @GET("movie/{movie_id}/images")
  Future<MovieImagesResponseList> getMovieImages(
      @Path('movie_id') String movieId);
}
