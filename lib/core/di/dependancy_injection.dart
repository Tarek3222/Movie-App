import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/core/firebase/auth_services.dart';
import 'package:movies/core/firebase/user_services.dart';
import 'package:movies/core/helper/cache_helper.dart';
import 'package:movies/core/networking/api_services.dart';
import 'package:movies/core/networking/dio_factory.dart';
import 'package:movies/features/category/data/repos/categories_repo.dart';
import 'package:movies/features/category/logic/cubit/get_movie_by_categories_cubit.dart';
import 'package:movies/features/home/data/repos/home_repo.dart';
import 'package:movies/features/home/logic/actors_cubit/actors_cubit.dart';
import 'package:movies/features/home/logic/movie_details_cubit/movie_details_cubit.dart';
import 'package:movies/features/home/logic/movie_images_cubit/movie_images_cubit.dart';
import 'package:movies/features/home/logic/movie_videos_cubit/movie_videos_cubit.dart';
import 'package:movies/features/home/logic/movies_cubit/movie_cubit.dart';
import 'package:movies/features/home/logic/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movies/features/home/logic/similar_movies_cubit/similar_movies_cubit.dart';
import 'package:movies/features/home/logic/top_rated_cubit/top_rated_movies_cubit.dart';
import 'package:movies/features/home/logic/trending_movie_cubit/trending_movie_cubit.dart';
import 'package:movies/features/login/data/repos/login_repo.dart';
import 'package:movies/features/login/logic/cubit/login_cubit.dart';
import 'package:movies/features/search/data/repos/search_repo.dart';
import 'package:movies/features/search/logic/cubit/search_movies_cubit.dart';
import 'package:movies/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:movies/features/sign_up/logic/cubit/sign_up_cubit.dart';

final getIt = GetIt.instance;

void setUp() {
  // authServices
  getIt.registerLazySingleton(
    () => AuthServices(),
  );
  // userServices
  getIt.registerLazySingleton(
    () => UserServices(),
  );
  // Shared Preferences
  getIt.registerFactory(() => CacheHelper());
  // Login
  getIt.registerLazySingleton(
    () => LoginRepo(
      authServices: getIt.get<AuthServices>(),
    ),
  );
  getIt.registerFactory(
    () => LoginCubit(
      loginRepo: getIt.get<LoginRepo>(),
    ),
  );
  // Sign Up
  getIt.registerLazySingleton(
    () => SignUpRepo(
      userServices: getIt.get<UserServices>(),
      authServices: getIt.get<AuthServices>(),
    ),
  );
  getIt.registerFactory(
    () => SignUpCubit(
      signUpRepo: getIt.get<SignUpRepo>(),
    ),
  );

  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(dio),
  );
  // Home
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepo(getIt<ApiService>()),
  );
  // !Movies Cubit
  getIt.registerFactory<MoviesCubit>(
    () => MoviesCubit(getIt<HomeRepo>()),
  );
  //!Actors Cubit
  getIt.registerFactory<ActorsCubit>(
    () => ActorsCubit(getIt<HomeRepo>()),
  );
  // !Movie Videos Cubit
  getIt.registerFactory<MovieVideosCubit>(
    () => MovieVideosCubit(getIt<HomeRepo>()),
  );
  //!Popular Movies Cubit
  getIt.registerFactory<PopularMoviesCubit>(
    () => PopularMoviesCubit(getIt<HomeRepo>()),
  );
  //!Top Rated Movies Cubit
  getIt.registerFactory<TopRatedMoviesCubit>(
    () => TopRatedMoviesCubit(getIt<HomeRepo>()),
  );
  //!Tranding Movies Cubit
  getIt.registerFactory<TrendingMovieCubit>(
    () => TrendingMovieCubit(getIt<HomeRepo>()),
  );
  getIt.registerFactory<MovieDetailsCubit>(
    () => MovieDetailsCubit(getIt<HomeRepo>()),
  );
  getIt.registerFactory<MovieImagesCubit>(
    () => MovieImagesCubit(getIt<HomeRepo>()),
  );
  getIt.registerFactory<SimilarMoviesCubit>(
    () => SimilarMoviesCubit(getIt<HomeRepo>()),
  );
  //!!Search Repo
  getIt.registerLazySingleton<SearchRepo>(
    () => SearchRepo(apiService: getIt<ApiService>()),
  );

  //!!Search Cubit
  getIt.registerFactory<SearchMoviesCubit>(
    () => SearchMoviesCubit(getIt<SearchRepo>()),
  );
  //!!Category Repo
  getIt.registerLazySingleton<CategoriesRepo>(
    () => CategoriesRepo(getIt<ApiService>()),
  );

  //!!getMoviesByGenre Cubit
  getIt.registerFactory<GetMovieByCategoriesCubit>(
    () => GetMovieByCategoriesCubit(getIt<CategoriesRepo>()),
  );
}
