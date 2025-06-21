import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/services/di/dependency_injection.dart';
import 'package:home_decor/src/core/services/routing/routes.dart';
import 'package:home_decor/src/features/forget_password/presentation/manager/cubit/forget_password_cubit.dart';
import 'package:home_decor/src/features/forget_password/presentation/pages/forget_password_page.dart';
import 'package:home_decor/src/features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:home_decor/src/features/login/presentation/pages/login_page.dart';
import 'package:home_decor/src/features/navbar/presentation/manager/cubit/navbar_cubit.dart';
import 'package:home_decor/src/features/navbar/presentation/pages/navbar_page.dart';
import 'package:home_decor/src/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:home_decor/src/features/signup/presentation/manager/cubit/signup_cubit.dart';
import 'package:home_decor/src/features/signup/presentation/pages/signup_page.dart';

/// Manage Routes
class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingPage:
        return MaterialPageRoute(builder: (context) => const OnboardingPage());

      case Routes.loginPage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginPage(),
          ),
        );

      case Routes.signupPage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupPage(),
          ),
        );

      case Routes.forgetPasswordPage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ForgetPasswordCubit>(),
            child: const ForgetPasswordPage(),
          ),
        );

      case Routes.navbarPage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<NavbarCubit>(),
            child: const NavbarPage(),
          ),
        );

      // case Routes.loginPage:
      //   MovieResponse movieResponse = settings.arguments as MovieResponse;
      //   int movieId = movieResponse.id;

      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //       create: (context) => getIt<MovieDetailsCubit>()
      //         ..getMovieDetails(movieId)
      //         ..getMovieRecommendations(movieId)
      //         ..getMovieSimilar(movieId),
      //       child: MovieDetailsPage(
      //         movie: movieResponse,
      //       ),
      //     ),
      //   );


      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Text('No route defined for ${settings.name}'),
          ),
        );
    }
  }
}
