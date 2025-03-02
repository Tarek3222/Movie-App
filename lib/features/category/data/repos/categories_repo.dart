import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies/core/networking/api_services.dart';
import 'package:movies/core/networking/failures.dart';
import 'package:movies/features/home/data/models/movie_response.dart';

class CategoriesRepo {
  final ApiService _apiService;

  CategoriesRepo(this._apiService);

  Future<Either<Failure, MovieResponseList>> getMoviesByGenre(
      {required int genreId}) async {
    try {
      var response = await _apiService.getMoviesByGenre(genreId);
      return Right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
