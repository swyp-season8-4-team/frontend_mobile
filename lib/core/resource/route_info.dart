/// 라우팅 설계에 필요한 자로구조
class RouteInfo {
  const RouteInfo({required this.name, required this.path});

  // route name : 전체 경로로 구성
  final String name;

  // route path : 상대 경로로 구성
  final String path;
}
