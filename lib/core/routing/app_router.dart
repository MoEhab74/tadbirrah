// ignore: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tadbirrah/core/services/get_it_service.dart';
import 'package:tadbirrah/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:tadbirrah/features/auth/presentation/views/auth_view.dart';
import 'package:tadbirrah/features/household_setup/presentation/manager/cubit/household_setup_cubit.dart';
import 'package:tadbirrah/features/household_setup/presentation/views/household_view.dart';
import 'package:tadbirrah/features/onboarding/presentation/views/on_boarding_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/profile_view.dart';
import '../../features/home/presentation/views/search_view.dart';
import 'app_routes.dart';
import 'main_shell_route.dart';

class AppRouter {
  AppRouter._();

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.onboarding,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) => AppRoutes.home,
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: AppRoutes.auth,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: const AuthView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.householdSetup,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<HouseholdSetupCubit>(),
          child: const HouseholdView(),
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShellRoute(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const HomeView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.search,
                builder: (context, state) => const SearchView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                builder: (context, state) => const ProfileView(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
