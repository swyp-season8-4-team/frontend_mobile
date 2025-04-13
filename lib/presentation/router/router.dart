import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/presentation/dessert/dessert_board_view.dart';
import 'package:frontend_mobile/presentation/home.dart';
import 'package:frontend_mobile/presentation/local_login/local_login_view.dart';
import 'package:frontend_mobile/presentation/map/map_view.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:frontend_mobile/presentation/splash_view.dart';
import 'package:go_router/go_router.dart';

final Provider<AppRouter> appRouterProvider = Provider<AppRouter>((Ref ref) {
  return AppRouter();
});

class AppRouter {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  final GoRouter _router = GoRouter(
    // TODO: 화면 플로우에 맞춰 initialLocation 수정 필요
    // 일단 splashView를 초기 location으로 적용
    initialLocation: AppRoutes.splash.name,
    navigatorKey: rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.splash.path,
        name: AppRoutes.splash.name,
        builder:
            (BuildContext context, GoRouterState state) => const SplashView(),
      ),
      GoRoute(
        path: AppRoutes.home.path,
        name: AppRoutes.home.name,
        builder: (BuildContext context, GoRouterState state) => const Home(),
      ),
      GoRoute(
        path: AppRoutes.auth.path,
        name: AppRoutes.auth.name,
        redirect: (BuildContext context, GoRouterState state) {
          // /auth로 이동하려 한다면, LocalLoginView로 리다이렉트
          if (state.fullPath == AppRoutes.auth.name) {
            return AppRoutes.localLogin.name;
          }

          return null;
        },
        routes: <RouteBase>[
          GoRoute(
            path: AppRoutes.localLogin.path,
            name: AppRoutes.localLogin.name,
            builder:
                (BuildContext context, GoRouterState state) =>
                    const LocalLoginView(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.map.path,
        name: AppRoutes.map.name,
        builder: (BuildContext context, GoRouterState state) {
          return const MapView();
        },
      ),

      /// 디저트 메이트
      GoRoute(
        path: AppRoutes.dessert.path,
        name: AppRoutes.dessert.name,
        redirect: (_, __) => null,
        routes: <RouteBase>[
          /// 게시판
          GoRoute(
            path: AppRoutes.dessertBoard.path,
            name: AppRoutes.dessertBoard.name,
            builder: (BuildContext context, GoRouterState state) {
              return const DessertBoard();
            },
          ),
        ],
      ),
    ],
  );

  GoRouter get routerConfig => _router;
}
