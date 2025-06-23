import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/api_call.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/data/data_source/remote/oauth_remote_data_source.dart';
import 'package:frontend_mobile/data/entity/oauth/apple_entity.dart';
import 'package:frontend_mobile/data/entity/oauth/kakao_entity.dart';
import 'package:frontend_mobile/data/mapper/oauth_mapper.dart';
import 'package:frontend_mobile/domain/model/oauth/apple_model.dart';
import 'package:frontend_mobile/domain/model/oauth/kakao_model.dart';
import 'package:frontend_mobile/domain/param/oauth/apple_params.dart';
import 'package:frontend_mobile/domain/param/oauth/kakao_params.dart';
import 'package:frontend_mobile/domain/repository/oauth_repository.dart';

final Provider<OauthRepository> oauthRepositoryProvider =
    Provider<OauthRepository>(
      (Ref ref) => OAuthRepositoryImpl(api: ref.read(oauthApiProvider)),
    );

class OAuthRepositoryImpl implements OauthRepository {
  OAuthRepositoryImpl({required this.api});

  final OauthRemoteDataSource api;

  @override
  Future<Result<KakaoModel, CustomException>> kakaoLogin({
    required KakaoParams params,
  }) async {
    return await apiCall(
      api: () async {
        final KakaoEntity result = await api.kakaoLogin(body: params.toBody());

        return result.toModel();
      },
    );
  }

  @override
  Future<Result<AppleModel, CustomException>> appleLogin({
    required AppleParams params,
  }) async {
    return await apiCall(
      api: () async {
        final AppleEntity result = await api.appleLogin(body: params.toBody());

        return result.toModel();
      },
    );
  }
}
