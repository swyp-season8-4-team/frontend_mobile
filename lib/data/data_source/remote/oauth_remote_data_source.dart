import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/network/app_dio.dart';
import 'package:frontend_mobile/data/entity/oauth/apple_entity.dart';
import 'package:frontend_mobile/data/entity/oauth/kakao_entity.dart';
import 'package:frontend_mobile/data/request_body/oauth/apple_request_body.dart';
import 'package:frontend_mobile/data/request_body/oauth/kakao_request_body.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/oauth_remote_data_source.g.dart';

final Provider<OauthRemoteDataSource> oauthApiProvider =
    Provider<OauthRemoteDataSource>((Ref ref) {
      final Dio dio = ref.read(appDioProvider);
      return OauthRemoteDataSource(dio);
    });

@RestApi()
abstract interface class OauthRemoteDataSource {
  factory OauthRemoteDataSource(Dio dio, {String? baseUrl}) =
      _OauthRemoteDataSource;

  /// OAuth 회원가입, 로그인
  @POST('/api/auth/oauth2/callback')
  Future<KakaoEntity> kakaoLogin({@Body() required KakaoRequestBody body});

  /// Apple 회원가입, 로그인
  @POST('/api/auth/oauth2/apple/callback')
  Future<AppleEntity> appleLogin({@Body() required AppleRequestBody body});
}
