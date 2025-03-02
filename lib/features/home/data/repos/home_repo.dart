import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies/core/networking/api_services.dart';
import 'package:movies/core/networking/failures.dart';
import 'package:movies/features/home/data/models/actor_response.dart';
import 'package:movies/features/home/data/models/movie_details_response.dart';
import 'package:movies/features/home/data/models/movie_images_response.dart';
import 'package:movies/features/home/data/models/movie_response.dart';
import 'package:movies/features/home/data/models/movie_video_response.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<Either<Failure, MovieResponseList>> getListMovies() async {
    try {
      MovieResponseList response = await _apiService.getListMovies();
      return Right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, MovieResponseList>> getTrendingMovies() async {
    try {
      MovieResponseList response = await _apiService.getTrendingMovies();
      return Right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, MovieResponseList>> getTopRatedMovies() async {
    try {
      MovieResponseList response = await _apiService.getTopRatedMovies();
      return Right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, MovieResponseList>> getPopularMovies() async {
    try {
      MovieResponseList response = await _apiService.getPopularMovies();
      return Right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, ActorListResponse>> getActors() async {
    try {
      ActorListResponse response = await _apiService.getActors();
      return Right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, MovieVideoResponseList>> getMovieVideos(
      {required String movieId}) async {
    try {
      MovieVideoResponseList response =
          await _apiService.getMovieVideos(movieId);
      return Right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, MovieDetailsResponse>> getMovieDeatils(
      {required String movieId}) async {
    try {
      MovieDetailsResponse response =
          await _apiService.getMovieDetails(movieId);
      return Right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, MovieImagesResponseList>> getMovieImages(
      {required String movieId}) async {
    try {
      MovieImagesResponseList response =
          await _apiService.getMovieImages(movieId);
      return Right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, MovieResponseList>> getSimilarMovies(
      {required String movieId}) async {
    try {
      MovieResponseList response = await _apiService.getSimilarMovies(movieId);
      return Right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
