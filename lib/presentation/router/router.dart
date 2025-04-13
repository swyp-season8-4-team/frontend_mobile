import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/presentation/find_password/view/find_password_step1.dart';
import 'package:frontend_mobile/presentation/find_password/view/find_password_step2.dart';
import 'package:frontend_mobile/presentation/find_password/view/find_password_step3.dart';
import 'package:frontend_mobile/presentation/home.dart';
import 'package:frontend_mobile/presentation/local_login/local_login_view.dart';
import 'package:frontend_mobile/presentation/map/map_view.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:frontend_mobile/presentation/splash_view.dart';
import 'package:frontend_mobile/presentation/taste/my_taste_choice/my_taste_choice_start.dart';
import 'package:frontend_mobile/presentation/taste/my_taste_choice/my_taste_choice_step1.dart';
import 'package:frontend_mobile/presentation/taste/my_taste_choice/my_taste_choice_step2.dart';
import 'package:frontend_mobile/presentation/taste/my_taste_choice/my_taste_choice_step3.dart';
import 'package:frontend_mobile/presentation/taste/my_taste_choice/my_taste_choice_step4.dart';
import 'package:frontend_mobile/presentation/taste/result/result.dart';
import 'package:frontend_mobile/presentation/taste/result/result_loading.dart';
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
      ),

      /// 취향선택
      GoRoute(
        path: AppRoutes.taste.path,
        name: AppRoutes.taste.name,
        redirect: (_, __) => null,
        routes: <RouteBase>[
          /// 내 취향 선택
          GoRoute(
            path: AppRoutes.myTasteChoice.path,
            name: AppRoutes.myTasteChoice.name,
            redirect: (_, __) => null,
            routes: <RouteBase>[
              /// 시작 페이지
              GoRoute(
                path: AppRoutes.myTasteChoiceStart.path,
                name: AppRoutes.myTasteChoiceStart.name,
                builder: (BuildContext context, GoRouterState state) {
                  return const MyTasteChoiceStart();
                },
              ),

              /// step1
              GoRoute(
                path: AppRoutes.myTasteChoiceStep1.path,
                name: AppRoutes.myTasteChoiceStep1.name,
                builder: (BuildContext context, GoRouterState state) {
                  return const MyTasteChoiceStep1();
                },
              ),

              /// step2
              GoRoute(
                path: AppRoutes.myTasteChoiceStep2.path,
                name: AppRoutes.myTasteChoiceStep2.name,
                builder: (BuildContext context, GoRouterState state) {
                  return const MyTasteChoiceStep2();
                },
              ),

              /// step3
              GoRoute(
                path: AppRoutes.myTasteChoiceStep3.path,
                name: AppRoutes.myTasteChoiceStep3.name,
                builder: (BuildContext context, GoRouterState state) {
                  return const MyTasteChoiceStep3();
                },
              ),

              /// step4
              GoRoute(
                path: AppRoutes.myTasteChoiceStep4.path,
                name: AppRoutes.myTasteChoiceStep4.name,
                builder: (BuildContext context, GoRouterState state) {
                  return const MyTasteChoiceStep4();
                },
              ),
            ],
          ),

          /// 결과 로딩 화면
          GoRoute(
            path: AppRoutes.tasteResultLoading.path,
            name: AppRoutes.tasteResultLoading.name,
            builder: (BuildContext context, GoRouterState state) {
              return const TasteResultLoading();
            },
          ),

          /// 결과 화면
          GoRoute(
            path: AppRoutes.tasteResult.path,
            name: AppRoutes.tasteResult.name,
            builder: (BuildContext context, GoRouterState state) {
              return const TasteResult();
            },
          ),
        ],
      ),
    ],
  );

  GoRouter get routerConfig => _router;
}
