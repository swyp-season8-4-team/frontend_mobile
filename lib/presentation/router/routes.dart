import 'package:frontend_mobile/core/resource/route_info.dart';

/// 앱에서 전반적으로 사용될 스크린 위젯(페이지) 경로(Route) 정보 정의
/// 경로정보들을 static 필드로 미리 정의한 후, 라우팅 구현 및 화면 전환 시 사용
abstract class AppRoutes {
  AppRoutes._();

  // 인증 관련 페이지의 기반 Route Info
  static const RouteInfo auth = RouteInfo(name: '/auth', path: '/auth');

  // 로그인 성공시, 이동하는 화면 (테스트용 페이지)
  static const RouteInfo home = RouteInfo(name: '/home', path: '/home');

  // 로그인 화면
  static final RouteInfo localLogin = RouteInfo(
    name: '${auth.name}/local_login',
    path: 'local_login',
  );
}
