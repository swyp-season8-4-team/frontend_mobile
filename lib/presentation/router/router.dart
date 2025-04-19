import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/presentation/dessert/dessert_board_view.dart';
import 'package:frontend_mobile/presentation/find_password/view/find_password_step1.dart';
import 'package:frontend_mobile/presentation/find_password/view/find_password_step2.dart';
import 'package:frontend_mobile/presentation/find_password/view/find_password_step3.dart';
import 'package:frontend_mobile/presentation/home.dart';
import 'package:frontend_mobile/presentation/local_login/local_login_view.dart';
import 'package:frontend_mobile/presentation/map/map_view.dart';
import 'package:frontend_mobile/presentation/map/search/search_store_view.dart';
import 'package:frontend_mobile/presentation/map/store_detail/find_place_by_map_view.dart';
import 'package:frontend_mobile/presentation/map/store_detail/notice/store_notice_detail_view.dart';
import 'package:frontend_mobile/presentation/map/store_detail/notice/store_notice_view.dart';
import 'package:frontend_mobile/presentation/map/store_detail/store_detail_view.dart';
import 'package:frontend_mobile/presentation/map/stores_by_user_store_list/stores_by_user_store_list_view.dart';
import 'package:frontend_mobile/presentation/map/user_store/add/add_user_store_list_view.dart';
import 'package:frontend_mobile/presentation/map/user_store/update/update_user_store_list_view.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:frontend_mobile/presentation/sign_up/view/sign_up_step1.dart';
import 'package:frontend_mobile/presentation/sign_up/view/sign_up_step2.dart';
import 'package:frontend_mobile/presentation/sign_up/view/sign_up_step3.dart';
import 'package:frontend_mobile/presentation/sign_up/view/sign_up_step4.dart';
import 'package:frontend_mobile/presentation/sign_up/view/sign_up_step5.dart';
import 'package:frontend_mobile/presentation/sign_up/view/sign_up_step6.dart';
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

          /// 회원가입
          GoRoute(
            path: AppRoutes.signUp.path,
            name: AppRoutes.signUp.name,
            redirect: (_, __) => null,
            routes: <RouteBase>[
              /// step1
              GoRoute(
                path: AppRoutes.signUpStep1.path,
                name: AppRoutes.signUpStep1.name,
                builder: (BuildContext context, GoRouterState state) {
                  return const SignUpStep1();
                },
              ),

              /// step2
              GoRoute(
                path: AppRoutes.signUpStep2.path,
                name: AppRoutes.signUpStep2.name,
                builder: (BuildContext context, GoRouterState state) {
                  final String email = state.extra as String;

                  return SignUpStep2(email: email);
                },
              ),

              /// step3
              GoRoute(
                path: AppRoutes.signUpStep3.path,
                name: AppRoutes.signUpStep3.name,
                builder: (BuildContext context, GoRouterState state) {
                  return const SignUpStep3();
                },
              ),

              /// step4
              GoRoute(
                path: AppRoutes.signUpStep4.path,
                name: AppRoutes.signUpStep4.name,
                builder: (BuildContext context, GoRouterState state) {
                  return const SignUpStep4();
                },
              ),

              /// step5
              GoRoute(
                path: AppRoutes.signUpStep5.path,
                name: AppRoutes.signUpStep5.name,
                builder: (BuildContext context, GoRouterState state) {
                  final bool isSelectedBoy = state.extra as bool;

                  return SignUpStep5(isSelectedBoy: isSelectedBoy);
                },
              ),

              /// step6
              GoRoute(
                path: AppRoutes.signUpStep6.path,
                name: AppRoutes.signUpStep6.name,
                builder: (BuildContext context, GoRouterState state) {
                  return const SignUpStep6();
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
          /// 가게 상세 조회
          GoRoute(
            path: AppRoutes.storeDetail.path,
            name: AppRoutes.storeDetail.name,
            builder: (BuildContext context, GoRouterState state) {
              final String? id = state.pathParameters['id'];
              if (id == null) {
                return const Scaffold();
              }
              return StoreDetailView(storeUuid: id);
            },
            routes: <RouteBase>[
              /// 길찾기
              GoRoute(
                path: AppRoutes.findPlaceByMap.path,
                name: AppRoutes.findPlaceByMap.name,
                builder: (BuildContext context, GoRouterState state) {
                  return const FindPlaceByMapView();
                },
              ),

              /// 모든 공지
              GoRoute(
                path: AppRoutes.storeNotice.path,
                name: AppRoutes.storeNotice.name,
                builder: (BuildContext context, GoRouterState state) {
                  final String? id = state.pathParameters['id'];
                  if (id == null) {
                    return const Scaffold();
                  }
                  return StoreNoticeView(storeUuid: id);
                },
                routes: <RouteBase>[
                  /// 공지 상세
                  GoRoute(
                    path: AppRoutes.storeNoticeDetail.path,
                    name: AppRoutes.storeNoticeDetail.name,
                    builder: (BuildContext context, GoRouterState state) {
                      final String? noticeId = state.pathParameters['noticeId'];

                      if (noticeId == null) {
                        return const Scaffold();
                      }

                      return StoreNoticeDetailView(
                        noticeId: int.parse(noticeId),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),

          /// 저장 리스트 수정
          GoRoute(
            path: AppRoutes.updateUserStoreList.path,
            name: AppRoutes.updateUserStoreList.name,
            builder: (BuildContext context, GoRouterState state) {
              final String? listId = state.pathParameters['listId'];
              if (listId == null) {
                return const Scaffold();
              }
              return UpdateUserStoreListView(listId: int.parse(listId));
            },
          ),

          /// 저장 리스트 내 가게 조회
          GoRoute(
            path: AppRoutes.storesByUserStoreList.path,
            name: AppRoutes.storesByUserStoreList.name,
            builder: (BuildContext context, GoRouterState state) {
              final String? listId = state.pathParameters['listId'];
              if (listId == null) {
                return const Scaffold();
              }
              return StoresByUserStoreListView(listId: int.parse(listId));
            },
          ),

          /// 지도 > 저장 리스트 생성
          GoRoute(
            path: AppRoutes.addUserStoreList.path,
            name: AppRoutes.addUserStoreList.name,
            builder:
                (BuildContext context, GoRouterState state) =>
                    const AddUserStoreListView(),
          ),

          /// 지도 > 검색
          GoRoute(
            path: AppRoutes.searchStore.path,
            name: AppRoutes.searchStore.name,
            builder:
                (BuildContext context, GoRouterState state) =>
                    const SearchStoreView(),
          ),
        ],
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
