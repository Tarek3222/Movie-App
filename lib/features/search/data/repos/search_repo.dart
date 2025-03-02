import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies/core/networking/api_services.dart';
import 'package:movies/core/networking/failures.dart';
import 'package:movies/features/home/data/models/movie_response.dart';

class SearchRepo {
  final ApiService apiService;

  SearchRepo({required this.apiService});

  Future<Either<Failure, MovieResponseList>> searchMovies(
      {required String query}) async {
    try {
      MovieResponseList response = await apiService.searchMovies(query);
      return Right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
