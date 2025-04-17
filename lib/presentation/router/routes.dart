import 'package:frontend_mobile/core/resource/route_info.dart';

/// 앱에서 전반적으로 사용될 스크린 위젯(페이지) 경로(Route) 정보 정의
/// 경로정보들을 static 필드로 미리 정의한 후, 라우팅 구현 및 화면 전환 시 사용
abstract class AppRoutes {
  AppRoutes._();

  static const RouteInfo splash = RouteInfo(name: '/splash', path: '/splash');

  // 로그인 성공시, 이동하는 화면 (테스트용 페이지)
  static const RouteInfo home = RouteInfo(name: '/home', path: '/home');

  // 인증 관련 페이지의 기반 Route Info
  static const RouteInfo auth = RouteInfo(name: '/auth', path: '/auth');

  // 로그인 화면
  static final RouteInfo localLogin = RouteInfo(
    name: '${auth.name}/local_login',
    path: 'local_login',
  );

  // 지도 화면
  static const RouteInfo map = RouteInfo(name: '/map', path: '/map');

  // 지도 > 가게 상세
  static final RouteInfo storeDetail = RouteInfo(
    name: '${map.name}/store/:id',
    path: 'store/:id',
  );

  // 지도 > 가게 상세 > 길찾기
  static final RouteInfo findPlaceByMap = RouteInfo(
    name: '${storeDetail.name}/find-place-by-map',
    path: 'find-place-by-map',
  );

  // 지도 > 검색 화면
  static final RouteInfo searchStore = RouteInfo(
    name: '${map.name}/search-store',
    path: 'search-store',
  );

  // 인증 > 비밀번호 찾기
  static final RouteInfo findPassword = RouteInfo(
    name: '${auth.name}/find_password',
    path: 'find_password',
  );

  // 인증 > 비밀번호 찾기 > step1
  static final RouteInfo findPasswordStep1 = RouteInfo(
    name: '${findPassword.name}/step1',
    path: 'step1',
  );

  // 인증 > 비밀번호 찾기 > step2
  static final RouteInfo findPasswordStep2 = RouteInfo(
    name: '${findPassword.name}/step2',
    path: 'step2',
  );

  // 인증 > 비밀번호 찾기 > step3
  static final RouteInfo findPasswordStep3 = RouteInfo(
    name: '${findPassword.name}/step3',
    path: 'step3',
  );
}
