import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies/core/di/dependancy_injection.dart';
import 'package:movies/core/firebase/auth_services.dart';
import 'package:movies/core/firebase/user_model.dart';
import 'package:movies/core/helper/cache_helper.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/features/category/logic/cubit/get_movie_by_categories_cubit.dart';
import 'package:movies/features/category/views/movies_by_genre_id_view.dart';
import 'package:movies/features/home/data/models/actor_response.dart';
import 'package:movies/features/home/data/models/movie_response.dart';
import 'package:movies/features/home/data/models/movies_genre.dart';
import 'package:movies/features/home/logic/movie_details_cubit/movie_details_cubit.dart';
import 'package:movies/features/home/views/actor_details_view.dart';
import 'package:movies/features/home/views/actors_expanded_view.dart';
import 'package:movies/features/home/views/main_view.dart';
import 'package:movies/features/home/views/movie_details_view.dart';
import 'package:movies/features/home/views/movies_expanded_view.dart';
import 'package:movies/features/login/logic/cubit/login_cubit.dart';
import 'package:movies/features/login/views/forget_password_view.dart';
import 'package:movies/features/login/views/login_view.dart';
import 'package:movies/features/on_boarding/views/on_boarding_view.dart';
import 'package:movies/features/settings/views/profile_view.dart';
import 'package:movies/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:movies/features/sign_up/views/sign_up_view.dart';

abstract class AppRouting {
  static final bool isFirstLaunch =
      CacheHelper.getData(key: 'isFirstLaunch') ?? true;
  static final router = GoRouter(
    initialLocation: isFirstLaunch
        ? AppRoutes.onBoarding
        : getIt.get<AuthServices>().auth.currentUser != null ||
                GoogleSignIn().currentUser != null
            ? AppRoutes.mainView
            : AppRoutes.loginView,
    routes: [
      GoRoute(
        path: AppRoutes.onBoarding,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: AppRoutes.profileView,
        builder: (context, state) => ProfileView(
          user: state.extra! as UserModel,
        ),
      ),
      GoRoute(
        path: AppRoutes.actorDetailsView,
        builder: (context, state) => ActorDetailsView(
          actor: state.extra! as ActorResponse,
        ),
      ),
      GoRoute(
        path: AppRoutes.moviesByGenreIdView,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt.get<GetMovieByCategoriesCubit>(),
          child: MoviesByGenreIdView(
            moviesGenre: state.extra! as MoviesGenre,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.movieDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt.get<MovieDetailsCubit>(),
          child: MovieDetailsView(
            movie: state.extra! as MovieResponse,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.moviesExpandedView,
        builder: (context, state) {
          final data = state.extra! as Map<String, dynamic>;
          return MoviesExpandedView(
            title: data['title'],
            movies: data['movies'],
          );
        },
      ),
      GoRoute(
        path: AppRoutes.actorsExpandedView,
        builder: (context, state) {
          final data = state.extra! as Map<String, dynamic>;
          return ActorsExpandedView(
            title: data['title'],
            actors: data['actors'],
          );
        },
      ),
      GoRoute(
        path: AppRoutes.mainView,
        builder: (context, state) => const MainView(),
      ),
      GoRoute(
        path: AppRoutes.forgetPasswordView,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: AppRoutes.loginView,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt.get<LoginCubit>(),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.signUpView,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt.get<SignUpCubit>(),
          child: const SignUpView(),
        ),
      ),
    ],
  );
}
