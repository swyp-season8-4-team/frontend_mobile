import 'package:envied/envied.dart';

part 'generated/env.g.dart';

/// 환경 변수 사용을 위한 Env class
/// obfuscate : 난독화 설정 여부
@Envied(path: '.env', obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'DEV_SERVER_BASE_URL')
  static final String devServerBaseUrl = _Env.devServerBaseUrl;

  @EnviedField(varName: 'PROD_SERVER_BASE_URL')
  static final String prodServerBaseUrl = _Env.prodServerBaseUrl;

  @EnviedField(varName: 'NAVER_MAP_CLIENT_ID')
  static final String naverMapClientId = _Env.naverMapClientId;
}
