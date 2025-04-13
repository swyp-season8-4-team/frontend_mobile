import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/network/app_dio.dart';
import 'package:frontend_mobile/data/entity/user/user_detail_entity.dart';
import 'package:frontend_mobile/data/request_body/user/patch_me_request_body.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/user_remote_data_source.g.dart';

final Provider<UserRemoteDataSource> userApiProvider =
    Provider<UserRemoteDataSource>((Ref ref) {
      final Dio dio = ref.read(appDioProvider);
      return UserRemoteDataSource(dio);
    });

@RestApi()
abstract interface class UserRemoteDataSource {
  factory UserRemoteDataSource(Dio dio, {String? baseUrl}) =
      _UserRemoteDataSource;

  /// 현재 사용자 정보 조회
  @GET('/api/users/me')
  Future<UserDetailEntity> getMe();

  /// 사용자 정보 수정
  @PATCH('/api/users/me')
  Future<UserDetailEntity> patchMe({@Body() required PatchMeRequestBody body});
}
