import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/presentation/find_password/view/find_password_step1.dart';
import 'package:frontend_mobile/presentation/find_password/view/find_password_step2.dart';
import 'package:frontend_mobile/presentation/find_password/view/find_password_step3.dart';
import 'package:frontend_mobile/presentation/home.dart';
import 'package:frontend_mobile/presentation/local_login/local_login_view.dart';
import 'package:frontend_mobile/presentation/map/map_view.dart';
import 'package:frontend_mobile/presentation/map/store_detail/find_place_by_map_view.dart';
import 'package:frontend_mobile/presentation/map/store_detail/store_detail_view.dart';
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
    initialLocation: AppRoutes.map.name,
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
          /// 로컬 로그인
          GoRoute(
            path: AppRoutes.localLogin.path,
            name: AppRoutes.localLogin.name,
            builder: (BuildContext context, GoRouterState state) {
              return const LocalLoginView();
            },
          ),

          /// 비밀번호 찾기
          GoRoute(
            path: AppRoutes.findPassword.path,
            name: AppRoutes.findPassword.name,
            redirect: (_, __) => null,
            routes: <RouteBase>[
              /// step1
              GoRoute(
                path: AppRoutes.findPasswordStep1.path,
                name: AppRoutes.findPasswordStep1.name,
                builder: (BuildContext context, GoRouterState state) {
                  return const FindPasswordStep1();
                },
              ),

              /// step2
              GoRoute(
                path: AppRoutes.findPasswordStep2.path,
                name: AppRoutes.findPasswordStep2.name,
                builder: (BuildContext context, GoRouterState state) {
                  final String email = state.extra as String;

                  return FindPasswordStep2(email: email);
                },
              ),

              /// step3
              GoRoute(
                path: AppRoutes.findPasswordStep3.path,
                name: AppRoutes.findPasswordStep3.name,
                builder: (BuildContext context, GoRouterState state) {
                  return const FindPasswordStep3();
                },
              ),
            ],
          ),
        ],
      ),

      /// 지도
      GoRoute(
        path: AppRoutes.map.path,
        name: AppRoutes.map.name,
        builder: (BuildContext context, GoRouterState state) {
          return const MapView();
        },
        routes: <RouteBase>[
          /// 가게 정보 상세
          GoRoute(
            path: AppRoutes.storeDetail.path,
            name: AppRoutes.storeDetail.name,
            builder: (BuildContext context, GoRouterState state) {
              final String? storeUuid = state.pathParameters['id'];
              if (storeUuid == null) {
                return const Scaffold();
              }
              return StoreDetailView(storeUuid: storeUuid);
            },
            routes: <RouteBase>[
              /// 길찾기
              GoRoute(
                path: AppRoutes.findPlaceByMap.path,
                name: AppRoutes.findPlaceByMap.name,
                builder:
                    (BuildContext context, GoRouterState state) =>
                        const FindPlaceByMapView(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  GoRouter get routerConfig => _router;
}
