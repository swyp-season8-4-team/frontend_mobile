import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/presentation/find_password/view/find_password_step1.dart';
import 'package:frontend_mobile/presentation/find_password/view/find_password_step2.dart';
import 'package:frontend_mobile/presentation/find_password/view/find_password_step3.dart';
import 'package:frontend_mobile/presentation/local_login/local_login_view.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

final Provider<AppRouter> appRouterProvider = Provider<AppRouter>((Ref ref) {
  return AppRouter();
});

class AppRouter {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  final GoRouter _router = GoRouter(
    // TODO: 화면 플로우에 맞춰 initialLocation 수정 필요
    initialLocation: AppRoutes.localLogin.name,
    navigatorKey: rootNavigatorKey,
    routes: <RouteBase>[
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

          GoRoute(
            path: AppRoutes.findPasswordStep1.path,
            name: AppRoutes.findPasswordStep1.name,
            builder:
                (BuildContext context, GoRouterState state) =>
                    const FindPasswordStep1(),
          ),
          GoRoute(
            path: AppRoutes.findPasswordStep2.path,
            name: AppRoutes.findPasswordStep2.name,
            builder: (BuildContext context, GoRouterState state) {
              final String email = state.extra as String;

              return FindPasswordStep2(email: email);
            },
          ),
          GoRoute(
            path: AppRoutes.findPasswordStep3.path,
            name: AppRoutes.findPasswordStep3.name,
            builder:
                (BuildContext context, GoRouterState state) =>
                    const FindPasswordStep3(),
          ),
        ],
      ),
    ],
  );

  GoRouter get routerConfig => _router;
}
